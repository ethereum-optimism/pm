# Release Readiness Checklist (RRC)

This document provides a detailed checklist of requirements that devnets must meet to be considered ready for release. These are specific tests, metrics, and criteria that are evaluated as part of the [Release Readiness](./release-readiness.md) process. 
The most up-to-date list can be found in the Optimism monorepo's [op-acceptance-tests](https://github.com/ethereum-optimism/optimism/tree/develop/op-acceptance-tests). 

TODO: We need to revisit this document to define how we'll treat different devnet types (localnet, alphanet, betanet, etc.). For example, the list items may remain the same but we'd modify the stringency/thresholds.


1. **Network Liveness**
   - Run the 'base' op-acceptor gate to run non-feature specific checks
   - New blocks are being produced at the expected rate
   - Transactions can be submitted and included in blocks
   - Confirm deposits work
   - Confirm we can send transaction on L2
   - Confirm that chains do not fork

2. **Network Health**
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

3. **Feature Verification**
   - Run the appropriate op-acceptor gate for the network
