# Release Readiness Checklist (RRC)

This document provides a detailed checklist of requirements that devnets must meet to be considered ready for release. These are specific tests, metrics, and criteria that are evaluated as part of the [Release Readiness](./release-readiness.md) process. 
The most up-to-date list can be found in the Optimism monorepo's [op-acceptance-tests](https://github.com/ethereum-optimism/optimism/tree/develop/op-acceptance-tests). 

TODO: We need to revisit this document to define how we'll treat different devnet types (localnet, alphanet, betanet, etc.). For example, the list items may remain the same but we'd modify the stringency/thresholds.


## Network Liveness

**1. op-acceptance-tests gates**

- Run the 'base' [op-acceptance-tests](https://github.com/ethereum-optimism/optimism/tree/develop/op-acceptance-tests) gate to run non-feature  checks expected to be satisfied any OP Stack chain.
- Here's a list of some of those tests:
    - RPC connectivity to all the nodes in the network
    - Unsafe and safe head progression
    - Absence of chain divergence across all the nodes of the network

**2. New blocks are being produced at the expected rate (targeted to be automated by Acceptance tests)**

- Use `eth_getBlockByNumber` (or `cast bl -r=<l2_rpc_url> latest`) against the EL clients (op-geth) deployed in your chain to observe if the blocks are progressing at the expected rate, or not.
- If they aren't, that could signify issues including but not limited to CL client (op-node), connectivity between the CL (op-node) and EL(op-geth), or resource exhaustion on these nodes.
- Some useful Prometheus metrics which can act as reliable indicators of this health are:
    - Block progression: `op_node_default_refs_number{type="l2_unsafe", layer="l2", ...}`
    - Engine API calls: `op_node_default_rpc_client_request_duration_seconds_bucket{method=~"engine_newPayloadV[0-9]"}`
    - Pending unsafe payloads on CL: `op_node_default_unsafe_payloads_buffer_len{...}`

**3. Transaction execution and inclusion**

- Use the `eth_sendRawTransaction` to perform transactions against the sequencer's EL RPC (chain's public RPC URL). The response should be that transaction's hash.
- Use the chain's block explorer or the `eth_getTransactionByHash` RPC to confirm that transaction's inclusion in the chain.
- Example of sending a transaction on L2 from one account (USER_PRIVATE_KEY) to the other (DEST_ADDR):

```
cast send --rpc-url $L2_PUBLIC_RPC_URL --value 0.01ether --private-key $USER_PRIVATE_KEY $DEST_ADDR
cast balance --rpc-url $L2_PUBLIC_RPC_URL $DEST_ADDR

```

- While doing this step, you can parallelly stream flashblocks as specified in Step 3. to see the quickness of your transaction's inclusion (actually its pre-confirmation) in the most recent flashblock i.e. noticing your transaction’s hash appear in the `transactions` array of a streamted flashblock.

**4. Confirm that deposits work**

- Send some tokens from a sender account to the OptimismPortalProxy address (specified in the superchain-registry under your chain config) for your chain to see them appear in the same account on your L2 chain.

```
cast send --rpc-url $ETH_L1_RPC --value 1ether --private-key $USER_PRIVATE_KEY $OPTIMISM_PORTAL_PROXY_ADDR
## in a few minutes
cast balance --rpc-url $L2_PUBLIC_RPC_URL $USER_ADDR

```

**5. Confirm that chains do not fork / diverge (targeted to be automated by Acceptance tests)**

- At any block height/number, all the nodes should depict the same block hash (hence, the same state root).
- Use the `eth_getBlockByNumber` RPC with `latest` param against the EL clients to observe the latest blocks they're at.
- The response of that RPC should contain many fields including block number, hash and state root.
- Comparison across the responses for that RPC method from all the EL clients for the same block number should yield the same block hashes.
- A common cause of chain divergence between some nodes can be differing rollup-configs configured on their respective CL clients (op-node).
    - You can confirm that with the `optimism_rollupConfig` RPC against the CL clients.


## Network Health (under OP Labs's Infrastructure)

   - Check the [SLA dashboard](https://optimistic.grafana.net/goto/WGOaGN1NR?orgId=1)
      - No SLA breaches
   - Alerts for the devnet
      - All P1 alerts have either been addressed or have a remediation plan
   - Check the [Bedrock Networks dashboard](https://optimistic.grafana.net/d/nUSlc3d4k/bedrock-networks?orgId=1&from=now-3h&to=now&timezone=browser&var-network=mainnet-prod&var-node=$__all&var-layer=$__all&var-safety=$__all&refresh=30s)
      - Chain heads are increasing as expected (unsafe, safe, l1 heads, etc)
      - Peer counts are nominal
   - Check the [Batcher Dashboard](https://optimistic.grafana.net/d/SF0r6OBVz/bedrock-batcher)
      - No long pending txns, errors, nonce is increasing
      - Safe head is increasing
   - Check the [Proposer Dashboard](https://optimistic.grafana.net/d/c543e3f0-4d2e-4b49-ac73-99a9363633ad/proposer)
      - No long pending txns, errors, nonce is increasing
   - Check the [Challenger Dashboard](https://optimistic.grafana.net/d/d1dc51c1-2ec5-4b85-8d3c-65eefaeab240/bedrock-challenger)
      - Should see games in progress, no error logs
   - Check the [Dispute Mon Dashboard](https://optimistic.grafana.net/d/edc89b93vev40c/dispute-monitor)
      - No incorrect forecasts / incorrect results or alerts
         - Note: It can take awhile for this to show up
   - Check the [Conductor Mon Dashboard](https://optimistic.grafana.net/d/cdlf92t90dxq8d/op-conductor-health-monitor)
      - Should be showing all the nodes, conductors all unpaused and healthy

## Feature Verification
Run the appropriate op-acceptor gate for the network
