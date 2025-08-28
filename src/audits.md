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

The resulting process integrates with the SDLC and enlists PgM and EVM Safety to help the Tech Lead execute the steps that are common to all audits, so that effort and uncertainty are minimised.

For further context on this process you can read [this companion document](https://www.notion.so/About-the-Audit-Process-1b9f153ee162805e8adcd2d50237c622?pvs=21) and the [references](#references).

## Summary

- [ ]  1. The need for audits is determined during the Risk Modeling in the Design Phase of the SDLC.
- [ ]  2. During the [Design Review](./sdlc.md#step-1-design-review-if-applicable), [start an Security Readiness Review document](./security-readiness-template.md), which will be continuously updated.
- [ ]  3. Once the design doc is merged with initial risk modeling completed, post the WIP [Security Readiness Review document](./security-readiness-template.md) to #pmo on Slack and tag @aaron to [schedule the audit](#audit-procurement) with the preferred auditors.
- [ ]  4. PMO will handle approval of the audit (via Zip) and help with the operational aspects of kicking off the audit. This process can be executed in parallel with all the remaining steps.
- [ ]  5. As implementation and testing approaches the release date, [decide on an audit start date](#audit-procurement). Make sure the Security Readiness Review document is complete before starting the audit.
- [ ]  6. [Execute the audit](#audit-execution).
- [ ]  7. [Make all required fixes](#audit-execution) and have them reviewed.
- [ ]  8: [Publish the deliverables](#after-each-audit)
- [ ]  9. [If any audit findings are high severity](#after-each-audit) and this is the last scheduled audit:
    - [ ]  9.1: [Perform a retro](./audit-post-mortem.md).
    - [ ]  9.2: Perform another audit, [go back to 2](#audit-procurement).

## Audit Procurement

The audit requirements are established during the project FMAs in the [Design Review phase of the SDLC](./sdlc.md#step-1-design-review-if-applicable) and captured in the [Security Readiness Document](./security-readiness-template.md). Both the audit procurement and the feature implementation can start in parallel once the design is reviewed.

The [Security Readiness Document](./security-readiness-template.md) is one of the deliverables from the design review and the primary artifact needed by PMO to schedule an audit.  This document will be updated as necessary during the delivery lifecyle. It contains:
 - A summary of the project (or a link to a suitable summary if it already exists).
 - All relevant links to the project documentation, including specs and FMAs.
 - The scope for the audit.

We use Spearbit as our preferred auditing services provider and have a established a retainer with them to streamline approval. However, the feature team can choose a different provider from [this list](https://www.notion.so/How-to-Select-an-Audit-Firm-b0dee471e23f4712bb8ddc1fb51938f9?pvs=21), from [past engagements](https://www.notion.so/Security-Audits-e56b4226b9db4f2ca48db42d7d439a98?pvs=21), or from any other source if they have a strong reason to go outside of Spearbit. Program Management (PMO) is available in the #pmo slack channel for assistance with anything related to engaging auditor services.

We don’t want to agree to exact audit dates too early, as that will compromise the quality of the software delivery. Instead, we will agree with auditors on a high-level schedule to confirm availability and ensure they are kept up to date on the implementation timeline and process, choosing an exact audit date close to the release date. Auditors not wishing to agree to this process should not be selected.

Auditors must agree to review the fixes to the vulnerabilities reported. Auditors not wishing to agree to this step should not be selected.

Once the [Security Readiness Document](./security-readiness-template.md) and auditor preference has been submitted, PMO will request a SOW from the vendor for approval [on Zip](https://oplabs.ziphq.com/create-workflow-request) by:
 - Choosing "Request a Purchase/Vendor Onboarding/Purchase Renewal".
 - Under "What are you looking to purchase?" select "Other".
 - If the auditors have not been engaged in the past they will need to supply legal agreements, which will be also included in the Zip request.

The audit can only be executed once the Zip request is approved. PMO will coordinate any administrative back and forth, scheduling, or meetings that need to happen leading up the audit approval and kickoff.

## Audit Execution

A devnet deployment is a [requirement for the audit execution](./sdlc.md#step-2b-security-audit-procurement-if-needed). As the date for the alphanet deployment is known with certainty, a date for the audit can be agreed so that the audit can be executed in parallel with the alphanet and betanet deployments and acceptance testing, and concluded before the testnet deployment.

We prefer to communicate with auditors over Slack during the audit. Questions from auditors should be answered promptly and carefully. These questions reveal gaps in the [specifications or the scope](./security-readiness-template.md), which should be amended accordingly.

Each vulnerability disclosed will be considered separately, fixed on an individual commit, and reviewed again by the auditors on the repo.

For all audit findings that we will fix as part of a later feature, create an issue for each finding in the monorepo. The issue title should be the finding title, the description links to the audit report, and apply the TBD label.

## After Each Audit

Once all the fixes are applied and reviewed, the project lead should upload the final audit report [to our repo](https://github.com/ethereum-optimism/optimism/tree/develop/docs/security-reviews).

If a valid high severity vulnerability was found, and this is the last expected audit for the project, [**a post-mortem must be conducted](./audit-post-mortem.md) and another audit of the same type must be scheduled**. These new audits follow the same process as any other audit.

## Emergency Process

The audit process is tied to the SDLC process. A fast-track audit process would only be needed if we find out that we need audits later in the SDLC process, most likely as a result of updates to the [risk modelling](./fmas.md) or [excessive vulnerabilities in the last scheduled audit](#after-each-audit). The process described above is still applicable in these cases.

If the audit process is started in later stages of the SDLC, the documentation will be ready and can be put together as the [Security Readiness Document](./security-readiness-template.md) by including a summary of the project, if that didn’t exist yet.

We already know that we need an audit, and we can safely assume that an external audit by Spearbit will fulfil the requirements.

The audit request still need to be approved via the Zip process above. If time doesn't allow for this then you should speak with your manager & PMO about your options to fast-track an audit as an exception.

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

- Update the [Failure Mode Analyses (FMAs)](https://www.notion.so/Failure-Mode-Analyses-FMAs-1fb9f65a13e542e5b48af6c850763494?pvs=21)
- Update the [Security <> Developer Interface](https://www.notion.so/Security-Developer-Interface-232f2c43e8474a2a90e07d3cbe0b33bc?pvs=21)
- Refactor the docs so that they point to the github repo with the reports, instead of pointing at individual reports.
- The success of this initiative depends partially on the SDLC process being adopted and respected.
- Include in the [SDLC](https://www.notion.so/Engineering-SDLC-v1-0-150f153ee16280d1b021c477957fac2f?pvs=21) process that other feature teams and EVM Safety should review specs and scope.
