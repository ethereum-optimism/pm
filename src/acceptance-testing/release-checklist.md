# Release Readiness Checklist (RRC)

This document provides a detailed checklist of requirements that devnets must meet to be considered ready for release. These are specific tests, metrics, and criteria that are evaluated as part of the [Release Readiness](./release-readiness.md) process. 
The most up-to-date list can be found in the Optimism monorepo's [op-acceptance-tests](https://github.com/ethereum-optimism/optimism/tree/develop/op-acceptance-tests). 

The criteria for the checks below apply to all devnets (alphanet, betanet, testnet, etc.) and should be considered a good minimum standard for acceptance.


## Sanity Check
A new Kubernetes-based network typically requires about 30mins to fully startup and settle. After this, we sanity check the basic network health.

- Check the [Superchain Health Dashboard](https://optimistic.grafana.net/goto/kdxUF-fHR?orgId=1)
   - Setup:
      - Select infra_env=dev, infra_network=<correct network>, security_network1=<correct network>
   - Checks:
      - Overall Infra reports "Healthy"
      - Overall Chain Progression Health reports "Healthy"
      - Dispute Mon Security Health 1 reports "Healthy"
      - Faultproof Withdrawals Security Health 1 reports "Healthy" (if applicable)
      - OP-Challenger Health reports "Healthy" (if applicable)
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

Note: For testing a flashblocks-enabled network, refer to this (Flashblocks RRC](https://www.notion.so/oplabs/Flashblocks-Release-Readiness-Checklist-1faf153ee16280ac80d8cda0162f2392).

### Automated Testing

See [this runbook](https://www.notion.so/oplabs/Devnet-Acceptance-Testing-2bef153ee1628062b22cdf55f1047c55?v=d784200583d9415587c4dcd2b0c64b2f&source=copy_link)
for an in-depth guide.

Run automated acceptance tests using [op-acceptor](https://github.com/ethereum-optimism/optimism/tree/develop/op-acceptance-tests).
   - Use the appropriate feature gate for the target network. This should not be `base`, but will include it. It should be one of the latest forks, such as `interop` or `flashblocks` which pertains to what the network is deployed as and testing.

The command will be something like so:
```
# Navigate to the optimism monorepo
cd optimism/op-acceptance-tests;

# Set your DEVNET_ENV_URL to point to the absolute path of
# your target networks devnet-env.json
DEVSTACK_ORCHESTRATOR=sysext
DEVNET_ENV_URL=/path/to/the/network/devnet-env.json

$(mise which op-acceptor) \
--testdir ../optimism \
--gate interop \
--validators ../acceptance-tests.yaml \
--log.level INFO
```

### Manual Testing
Manually run any non-automated feature tests.
(Note: This is a temporary step until we automate all of our current tests. Going forward we aim to have no manual feature tests.)

## Load Testing
Run automated acceptance tests using op-acceptor
   - Use load-testing gate for the network
