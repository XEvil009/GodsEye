# Dependency Register

Architecture v1.0 planned dependencies:

- Node.js 22+
- TypeScript
- Next.js
- Kotlin / Android development toolchain
- PostgreSQL
- Supabase Realtime
- MapLibre GL JS
- Git

Installation status: NOT VERIFIED.
No project dependencies installed during documentation initialization.

Every future addition, removal or version change requires
documentation and a Rule 10 change record.


## GODSEYE-CHG-0005 — Verified Web Workspace Dependency Plan

Verification date: 2026-11-20
Verification method: npm registry metadata lookup using `npm view`.

Runtime verified:
- Node.js: v24.22.2
- npm: 12.2.1
- Next.js requirement: Node.js >=20.9.0
- Runtime compatibility check: PASS

Exact proposed application dependencies:

Runtime dependencies:
- next: 16.4.6
- react: 19.3.1
- react-dom: 19.3.1

Development dependencies:
- typescript: 5.9.3
- @types/node: 24.19.2
- @types/react: 19.3.0
- @types/react-dom: 19.3.0

All seven exact package versions resolved successfully through npm registry metadata.

Installation status: NOT INSTALLED.
Source implementation status: NOT STARTED.
These versions are pinned for the initial workspace setup under GODSEYE-CHG-0005.
Do not silently upgrade or replace them.

## Android ARM64 Build Compatibility — 2026-11-20

- Next.js: 16.4.6
- Production bundler: Webpack (`next build --webpack`)
- Reason: Turbopack native bindings are unavailable in the current Android ARM64 Termux environment.
- Verification: Root `npm run build` completed successfully.
- Additional dependency installation: None.
