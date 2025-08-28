# Failure Mode Analysis (FMAs)

# Overview
Our Failure Mode Analysis is loosely based on [FME(C)As from aerospace engineering](https://en.wikipedia.org/wiki/Failure_mode_and_effects_analysis) and are intended to shift left the process of thinking through the risks associated with a project, so that mitigations can be planned for and implemented earlier rather than later.

# Writing a Failure Modes Analysis
As part of the effort towards working in the open, we have open sourced both the FMA process and the FMA template so protocol developers from the whole collective can adopt this process. 

To write the FMA for your project, follow the [FMA template](https://github.com/ethereum-optimism/design-docs/blob/main/assets/fma-template.md). You can use the many [existing FMAs](https://github.com/ethereum-optimism/design-docs/tree/main/security) as examples to understand how to write yours.

FMAs live in the [design-docs](https://github.com/ethereum-optimism/design-docs/blob/main/security/failure-modes-analysis.md) or [design-docs-private](https://github.com/ethereum-optimism/design-docs-private) repo.

# Determine Audit Requirements
The knowledge obtained in writing the FMA will help you determine the [audit](./audits.md) requirements for your project. EVM Safety is available if you need advice on this step.

1. Broadly determine the risk of the change. To do that consider the FMA and the [Liveness vs. Safety and Reputational vs. Existential matrix](https://gov.optimism.io/t/op-labs-audit-framework-when-to-get-external-security-review-and-how-to-prepare-for-it/6864#what-code-should-be-audited-3) to find out the [maximum severity incident](https://www.notion.so/Incident-Management-17268107b18d4c7492cab3d319d30533?pvs=21) that can be caused by the software to be audited. Then determine a subjective risk category by comparing your code to the descriptions below:
<br>**Low**: The feature doesn’t involve any components that can cause a significant incident.
<br>**Medium**: A bug in the feature could lead to a temporary denial of service, or small loss of value across all users, or a large loss of value across a small amount of users.
<br>**High**: Bugs in the feature could lead to denials of service lasting days or more, or a significant loss of assets.

2. Determine a subjective complexity category by comparing your code to the examples below:
<br>**Low:** Any code that is easy to explain to a non technical person, and easy reason about as a whole.
<br>**Medium:** Code with several components that are each easy to reason about, or with a single feature that is complex.
<br>**High:** Large codebase with several components, which are complex in their own right. Use of math, algorithms, architectural patterns, integration patterns or features that are novel or difficult to explain to a non technical person.

3. Find the required audits for your risk and complexity in the table below. Read more about [audit types](https://www.notion.so/About-the-Audit-Process-1b9f153ee162805e8adcd2d50237c622?pvs=21).
<br>The table was [calibrated to past audits](https://www.notion.so/Calibration-1bbf153ee16280d0a17adebee7f797e3?pvs=21), but it is a statement of minimums and you always have the option to execute more audits than specified.
<br>Internal audits should be executed before external audits.
<br>For internal audits we currently use the Coinbase Protocol Security Team. We also have a Spearbit retainer that can be used for internal audits. EVM Safety doesn’t do internal audits.
<br>Instead of an internal audit, you can also upgrade to a solo external audit or external audit by an up-and-coming team. It is also possible to replace an internal with an external auditor that advises during design and implementation.
<br>For high complexity features, contests are also an option. 

|  | **Low Risk** | **Medium Risk** | **High Risk** |
| --- | --- | --- | --- |
| **Low Complexity** | Peer Review | Internal Audit | External Audit |
| **Medium Complexity** | Internal Audit | External Audit | Internal Audit + External Audit |
| **High Complexity** | External Audit | Internal Audit + External Audit | External Audit x2 |

It is in the interest of the Tech Lead to accurately estimate the complexity and risk of the feature, with all the help provided. A major update to the FMAs in later stages of the SDLC or a High vulnerability found in the last audit will impact delivery times more than preparing for an audit or two from early stages.

# Table of Failure Modes Analyses

[FMAs on Notion](https://www.notion.so/oplabs/Failure-Mode-Analyses-FMAs-1fb9f65a13e542e5b48af6c850763494?pvs=4#7279d87ce31644e4a725f837096bb24c)
