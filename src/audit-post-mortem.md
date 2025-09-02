# Audit Post-Mortem
It is not realistic to ask of anyone to either build code completely free of bugs, nor to catch all bugs in code that has already been written. However, we can demand that no severities of a certain category are found after applying a number of security measures. In particular, we want to ensure that SEV1+ bugs are never found in the last pre-production layer or during production.

This is a process to apply when this expectation is not met, and is based in **reasonable expectations** from all involved, with no one expected to have extraordinary capabilities.

A piece of code is made progressively bug-free by applying layers of security. Unit testing, end-to-end testing, invariant testing, formal verification, peer reviews, internal audits, external audits and bug bounties are all layers of security.

If a SEV1+ bug is found too close to production, it can only be for two reasons:

1. At least one security layer underperformed, probably more than one.
2. Not enough security layers were applied.

By comparing the bug found and the security layers, it should be obvious to see if any of them underperformed by assessing the kind of bugs that should *reasonably* caught in it.

- Did the bug pass through some code that should have been covered by unit testing?
- Maybe the bug depended on the interaction between several components, is this a known scenario that is not covered by end-to-end testing?
- We do invariant testing, but we didn’t test the invariant that would have revealed the bug?
- Is the bug known to the security researcher community at large, but the audits missed it?

If a security layer is found to have underperformed, then the solution should be to strengthen it.

However, maybe our existing layers performed reasonably well, but we just didn’t apply enough of them. Maybe the bug was of the kind that would have been caught in an audit, only that we didn’t do one. Maybe the codebase was too complex for all issues to surface in a single audit or contest.

In that case, it might be that we misclassified the risk or complexity of the code. The process should be strengthened so that risk and complexity are correctly identified.

Finally, it might just be that risk and complexity were correctly identified, all security layers performed reasonably well, and we still got a bug. That still means that we need more layers, so then the only thing that is left is that the table that tells you how many audits you need is not demanding enough. In that case we shift the requirements to the left, so that the same risk and complexity get more security layers than before.