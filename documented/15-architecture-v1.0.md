# GodsEye — Architecture Baseline v1.0

**Status: FROZEN**
**Date: 2026-11-20**
**Implementation: NOT STARTED**

## Product
A consent-based live GPS location platform associating
verified mobile numbers with explicitly registered devices.

A phone number alone cannot reveal live GPS coordinates.

## Technology
- Android companion: Kotlin
- Runtime: Node.js 22+
- Backend: TypeScript / Next.js Route Handlers
- Web: Next.js
- Database: PostgreSQL
- Realtime: Supabase Realtime
- Maps: MapLibre GL JS
- Hosting: Vercel
- Version control: GitHub primary, GitLab secondary

## Architecture
1. Android companion and GPS permissions.
2. API, OTP and authentication.
3. PostgreSQL data storage.
4. Authenticated realtime delivery.
5. Web dashboard and map.

## Security
Explicit, visible and revocable location sharing.
Server-side authorization for every location access.
No covert tracking or unauthorized surveillance.
No secrets committed to source control.
Location retention and deletion policies required.

## Milestones
1. Project foundation.
2. Backend foundation.
3. Android companion.
4. Mobile number association.
5. Realtime engine.
6. Web dashboard.
7. Security and testing.
8. GitHub, GitLab and Vercel delivery.

## Mandatory Rules
All ten rules are recorded in 02-development-rules.md.
Rule 10 requires a reasoned change record for every future
modification.

## Freeze declaration
This is the approved Version 1.0 architecture baseline.
Changes require documented approval and change management.
This document does not claim that code, infrastructure,
repository publication or deployment already exists.
