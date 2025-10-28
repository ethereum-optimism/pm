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
It is the responsiblity of the project DRI to determine if an external audit is needed. The knowledge obtained in writing the FMA will help you determine the [audit](./audits.md) requirements for your project. EVM Safety is available if you need advice on this step.

For context, please read [this framework from John Mardlin](https://gov.optimism.io/t/op-labs-audit-framework-when-to-get-external-security-review-and-how-to-prepare-for-it/6864). 

## Using threat modelling to determine audit requirements

If using threat modelling, it is possible to use a more deterministic approach to answer whether an audit is needed or not.

To do so, audits wouldn't be initially included in developing the threat trees. Once the trees are completed, depending on the severity and likelihood of the outcomes, audits can be added as mitigations.

If the severity or likelihood of a negative outcome is high (safety outcome possible with red or purple likelihood), you should consider first if there are any alternative mitigations that you can employ, such as refactoring the project or adding redundancies or safeguards. An audit only provides a limite amount of safety.

It is suggested that safety outcomes with yellow or worse likelihood undergo an audit. Likewise for liveness outcomes with red or worse likelihood. The effectiveness of the audit in lowering likelihoods in the threat model is left to the DRI.

Partners might require an audit, we do not have a process to determine this at the moment, but you should socialize the project with the affected partners and gather feedback.

This leaves that some projects might not need an audit, in particular those where safety outcomes are all green before audits, and liveness outcomes are at most yellow, also before audits.

# Table of Failure Modes Analyses

[FMAs on Notion](https://www.notion.so/oplabs/Failure-Mode-Analyses-FMAs-1fb9f65a13e542e5b48af6c850763494?pvs=4#7279d87ce31644e4a725f837096bb24c)
