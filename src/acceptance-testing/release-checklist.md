# Release Readiness Checklist (RRC)

This document provides a detailed checklist of requirements that devnets must meet to be considered ready for release. These are specific tests, metrics, and criteria that are evaluated as part of the [Release Readiness](./release-readiness.md) process. 
The most up-to-date list can be found in the Optimism monorepo's [op-acceptance-tests](https://github.com/ethereum-optimism/optimism/tree/develop/op-acceptance-tests). 


1. **Network Liveness**
   - New blocks are being produced at the expected rate
   - Transactions can be submitted and included in blocks
   - Confirm deposits work
   - Confirm we can send transaction on L2
   - Confirm that chains do not fork

2. **Network Health**
   - The SLA dashboard is checked
   - Alerts for the devnet are checked

3. **Feature Verification**
   - Run the appropriate op-acceptor gate for the network
