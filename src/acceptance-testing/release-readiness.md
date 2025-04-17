# Release Readiness Process (RRP)

## Overview

This document defines the process and expectations for devnet releases in the OP Stack. It establishes a consistent framework for determining when a devnet is ready for release and how pass/fail determinations are made. By following these procedures, we can ensure that devnets meet quality standards before release.

While the Platforms team serves as the primary custodian of this release readiness process, its success relies on collaborative ownership between Platforms and Protocol as well as contributions from across the organization.

## Roles and Responsibilities

| Role | Responsibilities |
|------|-----------------|
| **Platforms Team** | • Maintain the Release Readiness Process<br>• Run acceptance tests<br>• Make final pass/fail determinations |
| **Feature Teams** | • Write and run feature-specific tests<br>• Fix identified issues in their features |

## Objectives

The primary objectives of the Devnet Release Readiness process are:

1. Release production networks without critical bugs
2. Ensure feature coverage through comprehensive testing
3. Establish a clear process for devnet promotion decisions

## Release Readiness Process

### Prerequisites

Before a devnet can be considered for release, the following prerequisites must be met:

1. All new features must have acceptance testing coverage in [op-acceptance-tests](https://github.com/ethereum-optimism/optimism/tree/main/op-acceptance-tests)
2. The acceptance tests, as defined by the Release Readiness Checklist, should be passing on a local kurtosis-based devnet

### Readiness Phases

The devnets are expected to be live for short periods of time. For example, alphanets will be decomissioned after three weeks.

#### 1. Deployment

- A devnet is deployed according to the [standard process](https://github.com/ethereum-optimism/devnets/blob/main/README.md)
- Basic infrastructure checks ensure the network is operational (manually for now; to be automated)


#### 2. Acceptance Testing
In this phase we work through the Release Readiness Checklist.
- Automated acceptance tests are run using op-acceptor
- Manual acceptance tests are run
  - Feature teams run specific feature tests
  - Platform runs security and load tests

#### 3. Results Analysis

- Each of the test results are categorized, in line with our internal incident severity matrix, by their potential impact had they been on mainnet:
  - **Catastrophic (SEV 0)**: Critical to catastrophic issue that would warrant public notification, leadership awareness (and potential involvement), and potential consultation with legal. A large number of users are impacted by complete or severe loss of functionality, and SLAs have been broken
  - **Critical (SEV 1)**: Critical issue that would warrant public notification. A large number of users are impacted by severe loss of functionality, and SLAs may have been broken
  - **Major (SEV 2)**: A functionality issue that would actively impact many user' ability to transact, or a critical issue impacting a subset of users
  - **Minor (SEV 3)**: Stability or minor customer-impacting issues that would require immediate attention from service owners

#### 4. Release Determination

- The Platforms team makes the final pass/fail determination
- A devnet must have ZERO critical issues to be considered for promotion
- Major issues must have mitigation plans before promotion
- Minor issues are documented but don't block promotion

#### 5. Release
When ready, the devnet is made live and public.

## Integration with Existing Release Process

The Devnet Release Readiness process integrates with the existing [Release Process](../release-process.md) as follows:

1. **Alphanet**: Before promotion to Betanet, it must pass the Release Readiness process
2. **Betanet**: Before promotion to Testnet, it must pass the Release Readiness process with stricter criteria
3. **Testnet**: All features must have successfully passed through Alphanet and Betanet before deployment

## Enforcement

Devnets shall not be released or promoted without following the release process described in this document. The Platforms team serves as the custodians of this document and guardians of the releases, with authority to block promotion of devnets that do not meet the release readiness criteria.

## Tools and Resources

- [op-acceptor](https://github.com/ethereum-optimism/infra/tree/main/op-acceptor) - The acceptance testing framework
- [op-acceptance-tests](https://github.com/ethereum-optimism/optimism/tree/develop/op-acceptance-tests) - Repository of acceptance tests
- [devnets](https://devnets.optimism.io/) - The Optimism devnet environment
- [Acceptance Testing](./index.md) - Additional context on acceptance testing process

## Future Considerations and Improvements

Here are some ideas for future iterations of this process:

* After each release, a retrospective to identify process improvements
* A Release Coordinator role to coordinate the overall release process, track progress, facilitate communication, and document decisions
* A per-devnet Release Readiness Checklist (RRC) to define specific requirements for each devnet
* Public usage phase to collect feedback from the general public
* Injection testing to see how we can break the network and test incident response runbooks
* Communication through dashboards and weekly calls
* Detailed Release Decision Documentation including summary of test results, list of issues, mitigation plans, and recommendations
* Test Results Reporting through the op-acceptor dashboard and Release Readiness Reports
* Test results comms, including:
  1. The op-acceptor dashboard, showing test status and results
  2. A Release Readiness Report documenting all tests, issues, and recommendations
  3. Updates in the weekly Protocol Upgrades Call
* Security
  1. We should explicitly define what we're checking for and how we do it
  2. For checking smart contracts, we could utilise a tool such as [solcurity](https://github.com/transmissions11/solcurity)