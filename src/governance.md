# Maintenance upgrade or regular upgrade with full governance process?

These rules of thumb should help you determine whether an upgrade is a maintenance upgrade or a regular protocol upgrade, based on the User Protections in the Law of Chains.
If in doubt, ask Bobby Dresser or Ben Jones.

## General rule of thumb

- If a change modifies consensus or messaging validity, requires Security Council action on L1, affects transaction inclusion/ordering, or introduces a non‑backwards‑compatible network‑wide upgrade, it is not a maintenance upgrade.
- All upgrades which require the Security Council to take action are not maintenance upgrades, unless it is an emergency bugfix.

## Law of Chains user protections (summary)

1. State Transition and Messaging Validity: OP Chain state transitions or cross‑chain messages must follow the rules of the latest governance‑approved release of the OP Stack.
2. Security, Uptime, and Liveness: Block production, sequencing, and bridging must satisfy uniform standards for security, uptime, and liveness across all OP Chains.
3. Universal, Governance‑Approved Upgrades: OP Chains must upgrade together under OP Stack releases that are approved by governance. Any non‑backwards‑compatible upgrade must be approved.

## Upgrade types and whether a vote is required

### Consensus Changes

- Upgrade type: Regular
- Rationale: Modifies the state transition function or messaging validity.
- Examples: Bedrock, EIP‑4844, Shanghai, any L1 upgrade modifying a contract under Security Council control (unless emergency bugfix).

### Predeploy Updates

- Upgrade type: Regular
- Rationale: Must be rolled out across all OP Chains to prevent divergence.

### Cross‑Chain Contracts

- Upgrade type: Maintenance (generally)
- Rationale: Contracts like Gnosis SAFE or `create2deployer` can be deployed at the same address across multiple chains by anyone at any time.
- Note: Any changes to the `0x42...` namespace do require governance, as do contract deployments that require irregular state transitions.

### Parameter Updates

- Upgrade type: Change dependent
- Rationale: If parameters impact security, uptime, or liveness they require approval (e.g., gas limit or EIP‑1559 parameters).
- Examples:
  - Updating ProxyAdmin/challenger/guardian addresses: vote required
  - Updating gas parameters: vote required until explicitly configurable by the Chain Governor
  - Updating batcher/proposer addresses (among already approved addresses): vote not required

### Non‑Consensus Client Features

- Upgrade type: Maintenance
- Rationale: Backwards‑compatible, does not risk chain split; coordinate with alt‑client developers as needed.
- Example: Snap sync

### Changes Affecting Transaction Inclusion/Ordering

- Upgrade type: Regular
- Rationale: Affects user experience and liveness; unilateral changes violate protections.
- Examples: Moving to a public mempool; running custom PBS/transaction pool software

### Non‑Consensus, No‑Coordination, Non‑Ordering Changes

- Upgrade type: Maintenance
- Rationale: Do not modify consensus or require cross‑chain coordination.

## Notes

- Categories are not always mutually exclusive. If a change fits multiple categories and any one requires a vote, the change requires a vote.
- If you are uncertain whether a change requires a governance vote, consult Ben Jones or Bobby Dresser.

# Maintenance upgrades - Governance requirements

- Maintenance upgrades must have a 7-day stakeholder review and veto period before they can be pushed to production. It is recommended that this coincides with the Sepolia Testnet deployment.
- To start the 7-day stakeholder veto period, the governance team needs the protocol upgrade proposal text to be posted to the forum [template here](https://github.com/ethereum-optimism/OPerating-manual/blob/main/Maintenance%20Upgrade%20Proposal%20Template.md) and sufficient heads up, as they will need to start an onchain vote.
- If the code changes after the veto period has started, the proposal text will need to be updated and the vote will have to be re-started. Therefore it is not recommended to start the review process too soon.


# Regular upgrades - Governance requirements
- Regular upgrades have two review and approval steps, first the Developer Advisory Board approval, then the stakeholder veto period, each 7 days.
- The Developer Advisory Board (DAB) is composed of 7 independent developers, who should already have been made aware of all the new features and releases in the pipeline before a release is cut.
- The DAB needs to vote on a release before the stakeholder veto period. At least five out of seven members must cast a vote.
- To initiate this process, the governance team needs the protocol upgrade proposal text to be posted to the forum [template here](https://github.com/ethereum-optimism/OPerating-manual/blob/main/Protocol%20Upgrade%20Template.md), and a heads up so they can start the process with the DAB.
- The DAB has a maximum of 7 days to submit their votes. It is recommended that this process is started before Sepolia deployment.
- If the code changes after the DAB has already voted, the proposal text will have to be updated and the vote restarted.
- Once the 7-day DAB review period is over, whether the outcome is a rejection or approval, the stakeholder veto period can begin. It is recommended, but not required, that this aligns with the Sepolia deployment.
- The 7-day stakeholder veto period can be started by the governance team as soon as the DAB approval period ends.
- If the DAB has rejected the upgrade, a stakeholder veto would override that decision and allow the upgrade to be deployed to production. If the DAB has approved the upgrade, a stakeholder veto would override the DAB’s decision and block the upgrade from deployment. The governance team will advise of the outcome.
- If an upgrade is blocked from deployment to mainnet, a discussion and appeals process facilitated by the governance team begins.
