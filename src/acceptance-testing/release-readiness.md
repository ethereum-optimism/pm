# Release Readiness Process (RRP)

## Overview

This document defines the process and expectations for devnet releases in the OP Stack. It establishes a consistent framework for determining when a devnet is ready for release, how results are communicated, and how pass/fail determinations are made. By following these procedures, we can ensure that devnets meet quality standards before promotion, reducing the risk of critical bugs reaching production networks.

## Roles and Responsibilities

While the Platforms team serves as the primary custodian of this release readiness process, its success relies on collaborative ownership with Protocol and contributions from across the organization.

| Role | Responsibilities |
|------|-----------------|
| **Platforms Team** | • Maintain the Release Readiness Process (RRP)<br>• Run acceptance tests<br>• Make final pass/fail determinations<br>• Communicate test results to stakeholders |
| **Feature Teams** | • Write acceptance tests for specific features<br>• Run feature-specific tests<br>• Fix identified issues in their features<br>• Provide input on severity of identified issues |
| **Release Coordinator** | • Coordinate the overall release process<br>• Track progress against the Release Readiness Checklist<br>• Facilitate communication between teams<br>• Document release decisions and rationales |

## Objectives

The primary objectives of the Devnet Release Readiness process are:

1. Release production networks without critical bugs
2. Ensure high feature coverage through comprehensive testing
3. Establish a clear process for devnet promotion decisions
4. Provide visibility into the release readiness of devnets
5. Define responsibilities for teams involved in the release process

## Release Readiness Process

### Prerequisites

Before a devnet can be considered for release, the following prerequisites must be met:

1. All required features must be deployed to the devnet
2. A Release Readiness Checklist (RRC) must be defined for the devnet
3. The [op-acceptor](https://github.com/ethereum-optimism/infra/tree/main/op-acceptor) testing framework must be configured for the devnet

### Readiness Phases

The devnets are expected to be live for short periods of time. For example, alphanets will be decomissioned after three weeks. This time will be roughly spent in five phases.

#### 1. Initial Deployment

- A devnet is deployed according to the [standard process](https://github.com/ethereum-optimism/devnets/blob/main/README.md)
- The Platforms team (Infrastructure Pod) verifies that all requested features are properly deployed
- Basic infrastructure checks are performed to ensure the network is operational
- When all looks good, the devnet is made live and public

#### 2. Public Usage

- At this point the devnet is live; the general public is free to use & test with it
- We collect any feedback

#### 3. Acceptance Testing

- All tests are executed against the [Release Readiness Checklist (RRC)](./release-checklist.md)
- Automated acceptance tests are run using op-acceptor
- For any manual tests remaining:
    - Feature teams run specific feature tests
    - Platform runs any other tests
    - Platform runs injection testing (looking to see how we can break the network, test incident response runbooks, ensure monitoring and alerting is working)
    - Platform runs load testing (validate performance under stress)
    - Platform runs security testing
- Test results are documented and tracked in the op-acceptor dashboard

#### 4. Results Analysis

- Test results & feedback are categorized as:
  - **Critical Issues**: Bugs that would cause data loss, security vulnerabilities, or severe service disruption
  - **Major Issues**: Bugs that significantly impact functionality but don't compromise security or data integrity
  - **Minor Issues**: Non-critical bugs that have workarounds or minimal impact

#### 5. Release Determination

- The Platforms team, as custodians of the release process, makes the final pass/fail determination
- A devnet must have ZERO critical issues to be considered for promotion
- Major issues must have clear mitigation plans before promotion
- Minor issues are documented and tracked but typically don't block promotion

## Communication and Documentation

### Test Results Reporting

Test results are communicated through:

1. The op-acceptor dashboard, showing test status and results
2. A Release Readiness Report documenting all tests, issues, and recommendations
3. Updates in the weekly Protocol Upgrades Call

### Release Decision Documentation

For each devnet release decision, the following is documented:

1. Summary of test results against the RRC
2. List of any issues found and their severity
3. Mitigation plans for identified issues
4. Final pass/fail determination with rationale
5. Recommendations for improvements in future releases

## Integration with Existing Release Process

The Devnet Release Readiness process integrates with the existing [Release Process](../release-process.md) as follows:

1. **Alphanet**: Before a feature can be promoted from Alphanet to Betanet, it must pass the Devnet Release Readiness process
2. **Betanet**: Before a Betanet can be promoted to Testnet, it must pass the Devnet Release Readiness process with stricter criteria
3. **Testnet**: All features must have successfully passed through Alphanet and Betanet Release Readiness before deployment to Testnet

## Enforcement

Devnets shall not be released or promoted without following the release process described in this document. The Platforms team serves as the custodians of this document and guardians of the releases, with authority to block promotion of devnets that do not meet the release readiness criteria.

## Continuous Improvement

This process is subject to continuous improvement:

1. After each release, a retrospective is conducted to identify process improvements
2. The Release Readiness Checklist is updated based on new learning and changing requirements
3. Test automation is expanded to reduce manual testing efforts
4. Metrics are collected to measure the effectiveness of the process in preventing issues from reaching production

## Tools and Resources

- [op-acceptor](https://github.com/ethereum-optimism/infra/tree/main/op-acceptor) - The acceptance testing framework
- [op-acceptance-tests](https://github.com/ethereum-optimism/optimism/tree/develop/op-acceptance-tests) - Repository of acceptance tests
- [devnets](https://devnets.optimism.io/) - The Optimism devnet environment
- [Acceptance Testing](./index.md) - Additional context on acceptance testing process 