# Failure Mode Analysis (FMAs)

# Overview

A Failure Mode Analysis is intended to shift left the process of thinking through the risks associated with a project, so that mitigations can be planned for and implemented earlier rather than later. 

**A finalized FMA is required prior to testnet deployments, an audit, and governance proposal.** 

More details from the [Security <> Developer Interface](https://www.notion.so/Security-Developer-Interface-232f2c43e8474a2a90e07d3cbe0b33bc?pvs=21):

- Engineering owns architecture decisions, then identifies possible risks in the launch and their mitigations in the Failure Modes Analysis (FMA). Security then owns reviewing the FMA for rigor by ensuring that the risks are exhaustive, their mitigations are acceptable, and overall the risk tolerance is consistent across all projects within the collective.
    - The decision to write an FMA is the responsibility of the project’s DRI. Typically, anything that could induce a safety or liveness failure should have an FMA.
    - The security team signs off on the FMA, and provides feedback to engineering on how they can achieve that sign-off.
    - Engineering needs to factor in the timeline for FMA review as part of our estimates. Speak with Security to determine the ETA on the FMA
    - The FMA author is responsible for program managing and driving the FMA to completion.

# Process for writing a Failure Modes Analysis

As part of the effort towards working in the open, we have open sourced both the FMA process and the FMA template so protocol developers from the whole collective can adopt this process. 

- The FMA template has been open sourced [here](https://github.com/ethereum-optimism/design-docs/blob/main/assets/fma-template.md).

# Determine Audit Requirements

Please contact EVM Safety if you need help determining the audit requirements for your project.

1. Determine the value at risk, by finding out what’s the [maximum severity incident](https://www.notion.so/Incident-Management-17268107b18d4c7492cab3d319d30533?pvs=21) that can be caused by the software to be audited. A SEV1 or SEV0 incident is equivalent to a high severity vulnerability.
Then determine a subjective risk category by comparing your code to the examples below:
**Low**: The feature doesn’t involve any components that can cause a significant loss of value.
**Medium**: The feature could lead to a temporary denial of service, or small loss of value across all users, or a large loss of value across a small amount of users.
**High**: The feature could lead to a significant loss of assets. 
2. Determine a subjective complexity category by comparing your code to the examples below:
**Low:** Any code less than 100 sloc, over less than 5 files.
**Medium:** More than Low, but less than High.
**High:** More than 1000 sloc, or more than 5 files with more than 100 sloc each. Or use of math, algorithms, architectural patterns, integration patterns or features that are novel or difficult to explain to a non technical person.
3. Find the required audits for your risk and complexity in the table below. Read more about [audit types](https://www.notion.so/About-the-Audit-Process-1b9f153ee162805e8adcd2d50237c622?pvs=21).
    1. The table was [calibrated to past audits](https://www.notion.so/Calibration-1bbf153ee16280d0a17adebee7f797e3?pvs=21), but it is a statement of minimums and you always have the option to execute more audits than specified.
    2. For internal audits we currently use the Coinbase Protocol Security Team, but you can also upgrade to a solo external audit or external audit by an up-and-coming team instead. EVM Safety doesn’t do internal audits at the time of writing. Internal audits should be executed before external audits.
    Instead of an internal audit, it is also possible to bring an external auditor to advise during design and implementation. We currently have a Spearbit retainer that can be used for this purpose.
    3. For high complexity features, contests are also an option. 

|  | **Low Risk** | **Medium Risk** | **High Risk** |
| --- | --- | --- | --- |
| **Low Complexity** | Peer Review | Internal Audit | External Audit |
| **Medium Complexity** | Internal Audit | External Audit | Internal Audit + External Audit |
| **High Complexity** | External Audit | Internal Audit + External Audit | External Audit x2 |

It is in the interest of the Tech Lead to accurately estimate the complexity and risk of the feature, with all the help provided. A major update to the FMAs in later stages of the SDLC or a High vulnerability found in the last audit will impact delivery times more than preparing for an audit or two from early stages.

# Table of Failure Modes Analyses

[FMAs on Notion](https://www.notion.so/oplabs/Failure-Mode-Analyses-FMAs-1fb9f65a13e542e5b48af6c850763494?pvs=4#7279d87ce31644e4a725f837096bb24c)
