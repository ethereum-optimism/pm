# Release Readiness Checklist (RRC)

*Coming soon*

This document will provide a detailed checklist of requirements that devnets must meet to be considered ready for release. The checklist will include specific tests, metrics, and criteria that are evaluated as part of the [Release Readiness](./release-readiness.md) process. 
The most up-to-date list can be found in the Optimism monorepo's [op-acceptance-tests](https://github.com/ethereum-optimism/optimism/tree/develop/op-acceptance-tests). 

The tests will include, but not be limited to topics such as:

1. **Network Liveness**
   - Blocks are being produced at the expected rate
   - Transactions can be submitted and included in blocks
   - The network recovers gracefully from disruptions

2. **Feature Verification**
   - Each feature functions according to its specifications
   - Features interact correctly with each other
   - Backward compatibility is maintained where required

3. **Upgrade Process**
   - The upgrade can be executed successfully
   - Rollback procedures are validated if applicable
   - Node operators can follow the upgrade process without issues

4. **Performance Benchmarks**
   - Transaction throughput meets expectations
   - Block production latency is within acceptable ranges
   - Resource utilization (CPU, memory, storage) is within sustainable limits

5. **Security Verification**
   - No known security vulnerabilities exist
   - Access controls function as expected
   - Critical operations are properly secured