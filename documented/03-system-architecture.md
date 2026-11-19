# GodsEye — System Architecture

Baseline: Version 1.0
Status: FROZEN

## Five architecture layers

1. Android companion:
   Kotlin, device registration, runtime permissions,
   GPS collection and explicit sharing controls.

2. API and authentication:
   Node.js 22+, TypeScript, Next.js Route Handlers,
   OTP verification, sessions and authorization.

3. Data storage:
   PostgreSQL for users, phone numbers, devices,
   consent, location updates and audit logs.

4. Realtime service:
   Supabase Realtime or an equivalent managed service.

5. Web dashboard:
   Next.js, Vercel and MapLibre GL JS.

## Data flow

1. User verifies mobile number.
2. User registers an Android device.
3. Device owner grants location permissions.
4. Device owner enables location sharing.
5. Device sends authenticated GPS updates.
6. Backend validates ownership and access.
7. Authorized viewers receive realtime updates.

A phone number is an identifier, not a GPS source.
