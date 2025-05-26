# Release Readiness Checklist (RRC)

This document provides a detailed checklist of requirements that devnets must meet to be considered ready for release. These are specific tests, metrics, and criteria that are evaluated as part of the [Release Readiness](./release-readiness.md) process. 
The most up-to-date list can be found in the Optimism monorepo's [op-acceptance-tests](https://github.com/ethereum-optimism/optimism/tree/develop/op-acceptance-tests). 

TODO: We need to revisit this document to define how we'll treat different devnet types (localnet, alphanet, betanet, etc.). For example, the list items may remain the same but we'd modify the stringency/thresholds.


## Sanity Check
A new Kubernetes-based network typically requires about 30mins to fully startup and settle. After this, we sanity check the basic network health.

- Check the [SLA dashboard](https://optimistic.grafana.net/goto/WGOaGN1NR?orgId=1)
   - Setup:
      - Select the correct network
      - SLO Evaluation Window = "10m", Period = "Last 30 minutes"
   - Checks:
      - Overall SLA should be >=99%
- Check the [Bedrock Networks dashboard](https://optimistic.grafana.net/d/nUSlc3d4k/bedrock-networks?orgId=1&from=now-30m&to=now&timezone=browser&var-network=mainnet-prod&var-node=$__all&var-layer=$__all&var-safety=$__all&refresh=30s)
   - Setup:
      - Select the correct network
      - Period = "Last 30 minutes"
   - Checks:
      - Chain heads are increasing as expected (unsafe, safe, l1 heads, etc)
      - Divergence < 1 for all nodes
      - Peer counts are nominal
- Check the [Batcher Dashboard](https://optimistic.grafana.net/d/SF0r6OBVz/bedrock-batcher)
   - Setup:
      - Select the correct network
      - Period = "Last 30 minutes"
   - Checks:
      - Block height is stricly increasing
      - RPC Errors are 0
      - No more than 1 pending transaction at any one time
- Check the [Proposer Dashboard](https://optimistic.grafana.net/d/c543e3f0-4d2e-4b49-ac73-99a9363633ad/proposer)
   - Setup:
      - Select the correct network
      - Cluster = "oplabs-dev-infra-primary", Period = "Last 30 minutes"
   - Checks:
      - Proposed Block Numbers are increasing
      - Publishing error count is zero (no-data)
      - Balance (ETH) is non-zero
- Check the [Challenger Dashboard](https://optimistic.grafana.net/d/d1dc51c1-2ec5-4b85-8d3c-65eefaeab240/bedrock-challenger)
   - Setup:
      - Select the correct network
      - Period = "Last 30 minutes"
   - Checks:
      - Should see games in progress
      - Challenger Error Logs should be empty (no data)
- Check the [Dispute Mon Dashboard](https://optimistic.grafana.net/d/edc89b93vev40c/dispute-monitor)
   - Setup:
      - Select the correct network
      - Period = "Last 30 minutes"
   - Checks:
      - No incorrect forecasts / incorrect results or alerts
         - Note: It can take awhile for this to show up
      - Error Logs should be empty (no data)
- Check the [Conductor Mon Dashboard](https://optimistic.grafana.net/d/cdlf92t90dxq8d/op-conductor-health-monitor)
   - Setup:
      - Select the correct network
      - Period = "Last 30 minutes"
   - Checks:
      - Leader count should be 1
      - Errors should be 0
      - Should be showing all the nodes, conductors all unpaused and healthy
- Alerts for the devnet
   - In Slack, check our #notify-devnets channel
      - All P1 alerts have either been addressed or have a remediation plan

## Feature Verification

### Automated Testing
Run automated acceptance tests using [op-acceptor](https://github.com/ethereum-optimism/optimism/tree/develop/op-acceptance-tests).
   - Use the appropriate feature gate for what the network is testing
   - Skip long tests (eg. load tests)

### Manual Testing
Manually run any non-automated feature tests.
(Note: This is a temporary step until we automate all of our current tests. Going forward we aim to have no manual feature tests.)

## Load Testing
Run automated acceptance tests using op-acceptor
   - Use the appropriate feature gate for what the network is testing
   - Do not skip any tests
