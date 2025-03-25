# Audit Process

## Context

[P1: Audit Process](https://www.notion.so/P1-Audit-Process-153f153ee16280cc8aacc75b955986b3?pvs=21)

> When teams need an audit, there should be a clear process with owners for all required steps: defining requirements and invariants, getting internal approvals, working with program management, talking to auditors, determining how many audits to get, what kinds of audits, negotiating audit prices, scheduling the audit, determining if a fix review is needed, and what to do with the results of an audit.
> 

This document describes the use of software audits at Op Labs. In includes:

- [An itemized step-by-step guide.](#summary)
- [Choosing a provider and preparing for the audit.](#audit-Procurement)
- [Executing the audit.](#audit-execution)
- [Reacting to the results of the audit.](#after-each-audit)
- [Updating this process according to results](#updating-this-process)

The resulting process enlists PgM and EVM Safety to help the Tech Lead execute the steps that are common to all audits. A back-of-the-envelope formula is used to estimate early the need for audits, later ratified or corrected during SDLC. There is one single document describing the feature, used by all parties, including auditors and CEO.

For further context on this process you can read [this companion document](https://www.notion.so/About-the-Audit-Process-1b9f153ee162805e8adcd2d50237c622?pvs=21) and the [references](#references).

## Summary

- [ ]  1. The need for audits is determined during the FMAs in the Design Phase of the SDLC.
- [ ]  2. During the [Design Review](https://www.notion.so/Engineering-SDLC-v1-0-150f153ee16280d1b021c477957fac2f?pvs=21), [start an Audit Readiness Review document](https://www.notion.so/Audit-Process-Updates-Q1-2025-173f153ee1628030bd48f2e90d06e165?pvs=21), which will be continuously updated.
- [ ]  3. Once the design is reviewed, [use PgM’s help to engage an auditor](#audit-procurement) and obtain a price estimate.
- [ ]  4. In parallel with the implementation, forward the Audit Readiness Review and price estimate to Karl for approval.
- [ ]  5. Once approved, use PgM’s help to complete the operational aspects of the audit. This process can be executed in parallel with all the remaining steps.
- [ ]  6. As implementation and testing approaches the release date, [decide on an audit start date](#audit-procurement).
- [ ]  7. [Execute the audit](#audit-execution).
- [ ]  8. [Make all required fixes](#audit-execution) and have them reviewed.
- [ ]  9: [Publish the deliverables](#after-each-audit)
- [ ]  10. [If any audit findings are high severity](#after-each-audit) and this is the last scheduled audit:
    - [ ]  10.1: [Perform a retro](./audit-post-mortem.md).
    - [ ]  10.2: Perform another audit, [go back to 2](#audit-procurement).

## Audit Procurement

The audit requirements are established during the project FMAs in the [Design Review phase of the SDLC](https://www.notion.so/Engineering-SDLC-v1-0-150f153ee16280d1b021c477957fac2f?pvs=21). Both the audit procurement and the feature implementation can start in parallel once the design is reviewed.

The [Audit Readiness Document](./audit-readiness-template.md) is one of the deliverables from the design review, which will be updated as necessary during the delivery lifecyle. This document contains:
 - A summary of the project (or a link to a suitable summary if it already exists).
 - All relevant links to the project documentation, including specs and FMAs.
 - The scope for the audit.

We use Spearbit as our preferred auditing services provider. However, the feature team can choose a different provider from [this list](https://www.notion.so/How-to-Select-an-Audit-Firm-b0dee471e23f4712bb8ddc1fb51938f9?pvs=21), from [past engagements](https://www.notion.so/Security-Audits-e56b4226b9db4f2ca48db42d7d439a98?pvs=21), or from any other source if they have a desirable skillset. Program Management (PgM) is available in the #pmo slack channel for assistance with anything related to engaging auditor services.

We don’t want to agree audit dates too early, as that will compromise the quality of the software delivery. Instead, we will agree with auditors to keep them tightly informed of the implementation timeline and process, choosing an exact audit date close to the release date. Auditors not wishing to agree to this process should not be selected.

Auditors must agree to review the fixes to the vulnerabilities reported. Auditors not wishing to agree to this step should not be selected.

Once an auditor has been selected by the feature team, PgM and EVM Safety can assist in preparing a [price and duration estimate](./audit-estimate-template.md). This estimate, along with the Audit Readiness Document, will be forwarded to the CEO for approval.

Once approved by the CEO, PgM will support the feature team [requesting the audit on Zip](https://oplabs.ziphq.com/create-workflow-request) as:
 - Choose "Request a Purchase/Vendor Onboarding/Purchase Renewal".
 - Under "What are you looking to purchase?" select "Other".
 - If the auditors have not been engaged in the past they will need to supply legal agreements, which will be also included in the Zip request

## Audit Execution

As the implementation and testing approach an state in which the code is ready to be frozen and a release date can be set with relative certainty, a date for the audit can be agreed.

We prefer to communicate with auditors over Slack during the audit. Questions from auditors should be answered promptly and carefully. These questions reveal gaps in the [specifications or the scope](./audit-readiness-template.md), which should be amended accordingly.

Each vulnerability disclosed will be considered separately, fixed on an individual commit, and reviewed again by the auditors on the repo.

For all audit findings that we will fix as part of a later feature, create an issue for each finding in the monorepo. The issue title should be the finding title, the description links to the audit report, and apply the TBD label.

## After Each Audit

Once all the fixes are applied and reviewed, upload the audit report [to our repo](https://github.com/ethereum-optimism/optimism/tree/develop/docs/security-reviews).

If a valid high severity vulnerability was found, and this is the last expected audit for the project, [**a post-mortem must be conducted](./audit-post-mortem.md) and another audit of the same type must be scheduled**. These new audits follow the same process as any other audit.

## Emergency Process

The audit process is tied to the SDLC process. A fast-track audit process would only be needed if we find out that we need audits later in the SDLC process, most likely as a result of updates to the  [FMAs](https://www.notion.so/Engineering-SDLC-v1-0-150f153ee16280d1b021c477957fac2f?pvs=21) or [excessive vulnerabilities in the last scheduled audit](#after-each-audit). The process described above is still applicable in these cases.

If the audit process is started in later stages of the SDLC, the documentation will be ready and can be put together as the [Audit Readiness Document](./audit-readiness-template.md) by including a summary to the CEO, if that didn’t exist yet.

We already know that we need an audit, and we can safely assume that an external audit by Spearbit will fulfil the requirements. Time and cost estimates can be provided with the help of PgM.

The documentation and estimates still need to be approved by the CEO. After approval by the CEO, the audit process doesn’t block delivery unless serious vulnerabilities are found.

## Updating This Process

This process will be reviewed if SEV0 or SEV1 incidents are revealed during **production**, reported through a **bug bounty**, or caught in the **last audit** before production. The [post-mortem](./audit-post-mortem.md) might recommend updating this process.

Conversely, this process can also be reviewed with the goal of relaxing its requirements if no SEV1 or SEV0 bugs or incidents have happened in production, the bug bounty, or any last audit for at least six months.

## References

- [Additional context on creating this process](https://www.notion.so/About-the-Audit-Process-1b9f153ee162805e8adcd2d50237c622?pvs=21)
- [Calibration of this process against past audits](https://www.notion.so/Calibration-1bbf153ee16280d0a17adebee7f797e3?pvs=21)
- [Repository with all audit reports](https://github.com/ethereum-optimism/optimism/tree/develop/docs/security-reviews)
- Our current framework for audits - https://gov.optimism.io/t/op-labs-audit-framework-when-to-get-external-security-review-and-how-to-prepare-for-it/6864
- An attempt to put an audit process in place - https://github.com/ethereum-optimism/wip-private-pm/blob/main/.github/ISSUE_TEMPLATE/audit.md
- EVM Safety docs on managing audits - [Security Audits](https://www.notion.so/Security-Audits-e56b4226b9db4f2ca48db42d7d439a98?pvs=21),[Audit FAQs](https://www.notion.so/Audit-FAQs-61950fe7ca7c4b2e86b86142d8138d3b?pvs=21),[How to Select an Audit Firm](https://www.notion.so/How-to-Select-an-Audit-Firm-b0dee471e23f4712bb8ddc1fb51938f9?pvs=21)
- [Audit Requirements for Fault Proof Contracts](https://www.notion.so/Audit-Requirements-for-Fault-Proof-Contracts-11cf153ee162803f84fed5d811206333?pvs=21)
- [Audits and shipping secure code](https://www.notion.so/Audits-and-shipping-secure-code-198f153ee162802e8fcae67e7cd15981?pvs=21) from @Paul Dowman summarizing Proofs informal audit framework and adding some ideas.

## Next Steps

- Update https://github.com/ethereum-optimism/design-docs/blob/main/assets/fma-template.md
- Update the SDLC in a PR: https://github.com/ethereum-optimism/pm/blob/main/src/sdlc.md
- Update the [Failure Mode Analyses (FMAs)](https://www.notion.so/Failure-Mode-Analyses-FMAs-1fb9f65a13e542e5b48af6c850763494?pvs=21)
- Update the  [Security <> Developer Interface](https://www.notion.so/Security-Developer-Interface-232f2c43e8474a2a90e07d3cbe0b33bc?pvs=21)
- Share in #pmo tagging Aaron Levin and Karl
- Ask Karl about preferred content of the [review template](https://docs.google.com/document/d/1dtUrBOl47sVs-Hw_2fxnPHx5JCg7qOU4nomh8KEHONU/edit?tab=t.0) that he will receive.
- Refactor the docs so that they point to the github repo with the reports, instead of pointing at individual reports.
- The success of this initiative depends partially on the SDLC process being adopted and respected.
- Include in the [SDLC](https://www.notion.so/Engineering-SDLC-v1-0-150f153ee16280d1b021c477957fac2f?pvs=21) process that audit scope is part of the specs.
- Include in the [SDLC](https://www.notion.so/Engineering-SDLC-v1-0-150f153ee16280d1b021c477957fac2f?pvs=21) process that other feature teams and EVM Safety should review specs and scope.
