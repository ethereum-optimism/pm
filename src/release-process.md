# Release Process

<!-- toc -->

Protocol upgrades run on a regular schedule. This helps resolve some of the challenges we've faced in the past:

- No more waiting 3-4 months between hard forks
- Teams don't need to rush features to "catch" an upgrade
- Everyone knows when the next release is coming
- We have the opportunity to find integration bugs earlier
- Missing a train isn't a big deal - there's always another one coming

The thousand-yard view of our release process is as follows:

1. Features are developed according to a stable-trunk development model.
2. Features are deployed to an Alphanet for initial acceptance testing.
3. If the feature works on Alphanet, it gets deployed to a Betanet for additional testing and upgrade process
   validation.
4. If the feature works on Betanet, it gets deployed to the Sepolia Testnet for governance review.
5. If governance passes, the feature is deployed to mainnet.

You will need to budget roughly 6 weeks from the time your feature is code-complete to the time it is deployed on
mainnet, exclusive of audit time. Working backwards from mainnet deployment, the rough timeline is as follows:

| Time      | Activity                                          |
|-----------|---------------------------------------------------|
| T         | Mainnet Activation                                |
| T-1 week  | Governance veto starts                            |
| T-2 weeks | Cut mainnet release, distribute to node operators |
| T-3 weeks | Governance vote starts                            |
| T-4 weeks | Governance review starts                          |
| T-4 weeks | Betanet deployment and acceptance testing         |
| T-5 weeks | Alphanet deployment and acceptance testing        |
| T-6 weeks | Feature is code-complete                          |

Check out the [release calendar](./release-calendar.md) for more information on the schedule.

## Alphanets

The Alphanet is the initial integration environment for protocol upgrades. Its primary purpose is to validate
that new features work correctly on a deployed network running real infrastructure before moving on to broader
integration and upgrade testing.

The Alphanet can contain any combination of L1 and L2 upgrades. It is entirely acceptable to have an Alphanet with
only L1 upgrades, and vice versa. By decoupling these two types of upgrades, we can increase our throughput and
deployment flexibility.

The scope of each Alphanet is finalized during the weekly Protocol Upgrades Call on Tuesdays. To put in a request 
for an Alphanet once the scope has been finalized, create a new issue on the
[devnets repo](https://github.com/ethereum-optimism/devnets/issues/new?template=devnet-request.yml).

## Betanets

The Betanet validates a complete upgrade that will be deployed to a production networks. Unlike the Alphanet, the
Betanet performs the actual upgrade process and confirms that all features work together as intended.

Betanets are deployed every three weeks, and contain the features that passed the Alphanet. If there are no passing
features, the Betanet will be cancelled.

The scope of each Betanet is finalized during the weekly Protocol Upgrades Call on Tuesdays. To put in a request
for a Betanet once the scope has been finalized, create a new issue on the
[devnets repo](https://github.com/ethereum-optimism/devnets/issues/new?template=devnet-request.yml).

## Acceptance Testing

Promoting a feature from Alphanet to Betanet and beyond is contingent upon the feature passing automated acceptance 
tests. See the [Acceptance Testing](./acceptance-testing.md) document for more information. 

## Testnet

The Sepolia Testnet is the first public deployment of protocol upgrades. This allows ecosystem partners to test the
upgrades in a stable environment and runs in parallel with the governance process. Unlike Alphanets and Betanets,
the Testnet directly impacts external users and applications and is considered "production."

TO provide sufficient time for infrastructure providers to upgrade their systems, Testnet releases must be cut at
least 1 week in advance of any hardfork activation.

**All features must go through an Alphanet and a Betanet before being deployed on Testnet.** This means that you
should target having your features deployed to the Alphanet and Betanet right before the gov cycle at the very latest.

See the [release calendar](./release-calendar.md) for the most up-to-date information on the release schedule.