# ADR-0001 — Initial Project Architecture

Status: ACCEPTED
Baseline: Version 1.0
Date: 2026-11-20

Decision:
Adopt the five-layer architecture documented in
03-system-architecture.md and the technology choices in
04-technology-stack.md.

Reason:
Separate Android GPS acquisition, backend authorization,
persistent storage, realtime delivery and web presentation.

Consequences:
Android background behavior, database policies, OTP provider,
realtime limits and hosting constraints require validation.

Changes to this baseline require Rule 10 documentation
and a new architecture version where applicable.
