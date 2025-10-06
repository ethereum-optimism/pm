# Audit Process

## Context

[P1: Audit Process](https://www.notion.so/P1-Audit-Process-153f153ee16280cc8aacc75b955986b3?pvs=21)

> When teams need an audit, there should be a clear process with owners for all required steps: defining requirements and invariants, getting internal approvals, working with program management, talking to auditors, determining how many audits to get, what kinds of audits, negotiating audit prices, scheduling the audit, determining if a fix review is needed, and what to do with the results of an audit.
>

This document describes the use of software audits at Op Labs. It includes:

- [An itemized step-by-step guide.](#summary)
- [Choosing a provider and preparing for the audit.](#audit-Procurement)
- [Executing the audit.](#audit-execution)
- [Reacting to the results of the audit.](#after-each-audit)
- [Updating this process based on results](#updating-this-process)

The resulting process integrates with the SDLC and enlists PgM and EVM Safety to help the Tech Lead execute the steps that are common to all audits, so that effort and uncertainty are minimized.

For further context on this process, you can read [this companion document](https://www.notion.so/About-the-Audit-Process-1b9f153ee162805e8adcd2d50237c622?pvs=21) and the [references](#references).

## Summary

- [ ]  1. The need for audits is determined during Risk Modeling in the Design Phase of the SDLC.
- [ ]  2. During the [Design Review](./sdlc.md#step-1-design-review-if-applicable), [start a Security Readiness Review document](https://www.notion.so/oplabs/190f153ee16280f397f2ee0329aef864), which will be updated as necessary.
- [ ]  3. When implementation and testing are about two weeks from the release date, complete the Security Readiness Review document and arrange an audit. If using Spearbit, share your [Security Readiness Review document](./security-readiness-template.md) in the #oplabs-spearbit-external channel and tag `@Sharon Ideguchi` & `@Marc Nicholson` in your request. If you do not have access to the Slack channel, please contact EVM Security.
- [ ]  4. This will result in an SOW from Spearbit, which you'll have to log in the Zip system.
- [ ]  5. [Execute the audit](#audit-execution).
- [ ]  6. [Make all required fixes](#audit-execution) and have them reviewed.
- [ ]  7. [Publish the deliverables](#after-each-audit)
- [ ]  8. [If any audit findings are high severity](#after-each-audit) and this is the last scheduled audit:
    - [ ]  8.1: [Perform a retro](./audit-post-mortem.md).
    - [ ]  8.2: Perform another audit, [go back to 2](#audit-procurement).

**Note**: If you identify that a new audit vendor will be required, you should start the onboarding process as soon as possible. The Zip request for new auditors will need to include legal agreements as well as the SOW. Approval can take several weeks and is a requirement for the audit starting.

## Audit Procurement

We use Spearbit as our preferred auditing services provider and have established a retainer with them to streamline approval. However, the feature team can choose a different provider from [this list](https://www.notion.so/How-to-Select-an-Audit-Firm-b0dee471e23f4712bb8ddc1fb51938f9?pvs=21), from [past engagements](https://www.notion.so/Security-Audits-e56b4226b9db4f2ca48db42d7d439a98?pvs=21), or from any other source if they have a strong reason to go outside of Spearbit.

Auditors must agree to review the fixes to the vulnerabilities reported. Auditors not wishing to agree to this step should not be selected.

The [Security Readiness Document](./security-readiness-template.md) is one of the deliverables from the design review and the primary artifact needed to schedule an audit.  This document will be updated as necessary during the delivery lifecycle. It contains:
 - A summary of the project (or a link to a suitable summary if it already exists).
 - All relevant links to the project documentation, including specs and FMAs.
 - The scope for the audit.
 - The desired start and end date for the audit.

Once the [Security Readiness Document](https://www.notion.so/oplabs/Security-Readiness-Document-1a8f153ee1628045b467c262fae21975) has been submitted, an SOW will be obtained from the vendor for approval [on Zip](https://oplabs.ziphq.com/create-workflow-request) by:
 - Choosing "Request a Purchase/Vendor Onboarding/Purchase Renewal".
 - Under "What are you looking to purchase?" select "Other".

## Audit Execution

A devnet deployment is a [requirement for the audit execution](./sdlc.md#step-2b-security-audit-procurement-if-needed). As the date for the alphanet deployment is known with certainty, a date for the audit can be agreed so that the audit can be executed in parallel with the alphanet and betanet deployments and acceptance testing, and concluded before the testnet deployment.

We prefer to communicate with auditors over Slack during the audit. Questions from auditors should be answered promptly and carefully. These questions reveal gaps in the [specifications or the scope](./security-readiness-template.md), which should be amended accordingly.

Each vulnerability disclosed will be considered separately, fixed in an individual commit, and reviewed again by the auditors in the repo.

For all audit findings that we will fix as part of a later feature, create an issue for each finding in the monorepo. The issue title should be the finding title, the description should link to the audit report, and the issue should be labeled "TBD".

## After Each Audit

Once all the fixes are applied and reviewed, the project lead should upload the final audit report [to our repo](https://github.com/ethereum-optimism/optimism/tree/develop/docs/security-reviews).

If a valid high severity vulnerability was found, and this is the last expected audit for the project, **[a post-mortem must be conducted](./audit-post-mortem.md) and another audit of the same type must be scheduled**. These new audits follow the same process as any other audit.

## Emergency Process

The audit process is tied to the SDLC process. A fast-track audit process would only be needed if we find out that we need audits later in the SDLC process, most likely as a result of updates to the [risk modeling](./risk-modelling.md) or [excessive vulnerabilities in the last scheduled audit](#after-each-audit). The process described above is still applicable in these cases.

If the audit process is started in later stages of the SDLC, the documentation will be ready and can be assembled into the [Security Readiness Document](https://www.notion.so/oplabs/Security-Readiness-Document-1a8f153ee1628045b467c262fae21975) by including a summary of the project, if that does not yet exist.

We already know that we need an audit, and we can safely assume that an external audit by Spearbit will fulfill the requirements.

The audit request still needs to be approved via the Zip process above.

## Updating This Process

This process will be reviewed if SEV0 or SEV1 incidents are revealed during **production**, reported through a **bug bounty**, or caught in the **last audit** before production. The [post-mortem](./audit-post-mortem.md) might recommend updating this process.

Conversely, this process can also be reviewed with the goal of relaxing its requirements if no SEV1 or SEV0 bugs or incidents have happened in production, via the bug bounty, or in any last audit for at least six months.

## References

- [Additional context on creating this process](https://www.notion.so/About-the-Audit-Process-1b9f153ee162805e8adcd2d50237c622?pvs=21)
- [Calibration of this process against past audits](https://www.notion.so/Calibration-1bbf153ee16280d0a17adebee7f797e3?pvs=21)
- [Repository with all audit reports](https://github.com/ethereum-optimism/optimism/tree/develop/docs/security-reviews)
- Our current framework for audits - [OP Labs forum post](https://gov.optimism.io/t/op-labs-audit-framework-when-to-get-external-security-review-and-how-to-prepare-for-it/6864)
- An attempt to put an audit process in place - [Issue template](https://github.com/ethereum-optimism/wip-private-pm/blob/main/.github/ISSUE_TEMPLATE/audit.md)
- EVM Safety docs on managing audits - [Security Audits](https://www.notion.so/Security-Audits-e56b4226b9db4f2ca48db42d7d439a98?pvs=21), [Audit FAQs](https://www.notion.so/Audit-FAQs-61950fe7ca7c4b2e86b86142d8138d3b?pvs=21), [How to Select an Audit Firm](https://www.notion.so/How-to-Select-an-Audit-Firm-b0dee471e23f4712bb8ddc1fb51938f9?pvs=21)
- [Audit Requirements for Fault Proof Contracts](https://www.notion.so/Audit-Requirements-for-Fault-Proof-Contracts-11cf153ee162803f84fed5d811206333?pvs=21)
- [Audits and shipping secure code](https://www.notion.so/Audits-and-shipping-secure-code-198f153ee162802e8fcae67e7cd15981?pvs=21) from @Paul Dowman summarizing Proofs informal audit framework and adding some ideas.


