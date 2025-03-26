# Security Readiness Document Template
Use this template as a guide to create an Audit Readiness Document. Note that such a document will only contain links to documentation elsewhere in the OP Labs documentation repositories.

## Summary of the Project, Feature, or Fix

- *Brief description of the systems, applications, or data to be audited.*
- *Specific areas of concern or risk to be addressed.*

## Design

Link to the design docs in either the [`design-docs`](https://github.com/ethereum-optimism/design-docs) or [`design-docs-private`](https://github.com/ethereum-optimism/design-docs-private) repositories.

## FMAs

Link to the FMAs in either the [`design-docs`](https://github.com/ethereum-optimism/design-docs) or [`design-docs-private`](https://github.com/ethereum-optimism/design-docs-private) repositories.

## Feature Specifications

Link to the relevant files in the [`specs`](https://github.com/ethereum-optimism/specs) repository.

## Audit Scope

In addition to the specs, the change being audited should be defined as a state change, ideally as a diff in the monorepo between two commits, filtered by the files involved. Other scope descriptions are acceptable as long as they list every code change that is part of the feature to be released.

## References

This template supersedes the [**Audit Request**](https://www.notion.so/Audit-Request-1a8f153ee1628045b467c262fae21975) template.