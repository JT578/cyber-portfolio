# How I Run Labs

## Environment
- Separate VM or container per lab
- Unique test-only creds
- Snapshot before/after

## Workflow
1. Define hypothesis and success criteria
2. Build minimal environment
3. Execute steps, capture evidence (pcap, logs)
4. Write detection or prevention
5. Teardown and document results

## Evidence
- Save logs/pcaps in `artifacts/`
- Note timestamps and commands used

## Teardown
- Destroy containers/VMs
- Verify creds removed and ports closed
