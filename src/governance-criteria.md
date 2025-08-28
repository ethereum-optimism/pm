# Governance Criteria

This document defines when changes require governance approval, based on the User Protections in the Law of Chains.
If in doubt, ask Bobby Dresser or Ben Jones.

## General rule of thumb

- If a change modifies consensus or messaging validity, requires Security Council action on L1, affects transaction inclusion/ordering, or introduces a non‑backwards‑compatible network‑wide upgrade, it generally requires a governance vote.
- All upgrades which require the Security Council to take action require a governance vote, unless it is an emergency bugfix.

## Law of Chains user protections (summary)

1. State Transition and Messaging Validity: OP Chain state transitions or cross‑chain messages must follow the rules of the latest governance‑approved release of the OP Stack.
2. Security, Uptime, and Liveness: Block production, sequencing, and bridging must satisfy uniform standards for security, uptime, and liveness across all OP Chains.
3. Universal, Governance‑Approved Upgrades: OP Chains must upgrade together under OP Stack releases that are approved by governance. Any non‑backwards‑compatible upgrade must be approved.

## Upgrade types and whether a vote is required

### Consensus Changes

- Vote required: Yes
- Rationale: Modifies the state transition function or messaging validity.
- Examples: Bedrock, EIP‑4844, Shanghai, any L1 upgrade modifying a contract under Security Council control (unless emergency bugfix).

### Predeploy Updates

- Vote required: Yes
- Rationale: Must be rolled out across all OP Chains to prevent divergence.

### Cross‑Chain Contracts

- Vote required: No (generally)
- Rationale: Contracts like Gnosis SAFE or `create2deployer` can be deployed at the same address across multiple chains by anyone at any time.
- Note: Any changes to the `0x42...` namespace do require governance, as do contract deployments that require irregular state transitions.

### Parameter Updates

- Vote required: Change dependent
- Rationale: If parameters impact security, uptime, or liveness they require approval (e.g., gas limit or EIP‑1559 parameters).
- Examples:
  - Updating ProxyAdmin/challenger/guardian addresses: vote required
  - Updating gas parameters: vote required until explicitly configurable by the Chain Governor
  - Updating batcher/proposer addresses (among already approved addresses): vote not required

### Non‑Consensus Client Features

- Vote required: No
- Rationale: Backwards‑compatible, does not risk chain split; coordinate with alt‑client developers as needed.
- Example: Snap sync

### Changes Affecting Transaction Inclusion/Ordering

- Vote required: Yes
- Rationale: Affects user experience and liveness; unilateral changes violate protections.
- Examples: Moving to a public mempool; running custom PBS/transaction pool software

### Non‑Consensus, No‑Coordination, Non‑Ordering Changes

- Vote required: No
- Rationale: Do not modify consensus or require cross‑chain coordination.

## Notes

- Categories are not always mutually exclusive. If a change fits multiple categories and any one requires a vote, the change requires a vote.
- If you are uncertain whether a change requires a governance vote, consult Ben Jones or Bobby Dresser.
