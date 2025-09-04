# SOP: How I Run Labs
1) Ethics & scope confirmed; record date/time and scope.
2) Start containers with docker compose up -d; note image SHAs.
3) Use pinned tools from this repo; versions recorded.
4) Record terminal output; save key artifacts to evidence/.
5) Recon → test/exploit → validate → cleanup; keep a timeline.
6) Throttle scans; stop on instability; no unknown payloads on host.
7) Capture root cause, remediation, and faster path next time.
8) docker compose down -v; rotate creds; commit notes and artifacts.
