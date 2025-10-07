# Failure Mode Analysis (FMAs)

# Overview
Our Failure Mode Analysis is loosely based on [FME(C)As from aerospace engineering](https://en.wikipedia.org/wiki/Failure_mode_and_effects_analysis) and are intended to shift left the process of thinking through the risks associated with a project, so that mitigations can be planned for and implemented earlier rather than later.

# Writing a Failure Modes Analysis
As part of the effort towards working in the open, we have open sourced both the FMA process and the FMA template so protocol developers from the whole collective can adopt this process. 

To write the FMA for your project, follow the [FMA template](https://github.com/ethereum-optimism/design-docs/blob/main/assets/fma-template.md). You can use the many [existing FMAs](https://github.com/ethereum-optimism/design-docs/tree/main/security) as examples to understand how to write yours.

FMAs live in the [design-docs](https://github.com/ethereum-optimism/design-docs/blob/main/security/failure-modes-analysis.md) or [design-docs-private](https://github.com/ethereum-optimism/design-docs-private) repo.

# Creating a Threat Model
Alternatively to an FMA, you can also create a threat model. To do so, duplicate [this board in Miro](https://miro.com/app/board/uXjVJZcWoL4=/?share_link_id=116069408256) and follow the instructions inside. Use other threat models for inspiration, and refer to them when possible instead of duplicating content.

# Determine Audit Requirements
The knowledge obtained in writing the FMA will help you determine the [audit](./audits.md) requirements for your project. EVM Safety is available if you need advice on this step.

For context, please read [this framework from John Mardlin](https://gov.optimism.io/t/op-labs-audit-framework-when-to-get-external-security-review-and-how-to-prepare-for-it/6864). The process belows refines it.

Do threat modelling of your feature, in doing so, do not consider audits as mitigations yet. When the threat modelling is complete, use the scale below:

- Safety outcome possible with red or purple likelihood: break the feature down or refactor it for increased safety.
- Safety outcome possible with yellow likelihood: audit required as a mitigation, which reduces the likelihood by one level.
- Liveness outcome possible with red or purple likelihood: audit required as a mitigation, which reduces the likelihood by one level.
- Partner requires an audit: audit required.
- Any other scenario: no audit required.

# Table of Failure Modes Analyses

[FMAs on Notion](https://www.notion.so/oplabs/Failure-Mode-Analyses-FMAs-1fb9f65a13e542e5b48af6c850763494?pvs=4#7279d87ce31644e4a725f837096bb24c)
