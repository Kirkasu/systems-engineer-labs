# Lab 2 — Automation & Scripting (PowerShell)

**Goal:** Create PowerShell scripts for patching, service restarts, and log exports; schedule via Task Scheduler and validate outputs.

## Tasks
1. **Patch Script:** Install Windows Updates via PS (e.g., `PSWindowsUpdate` module) and log results.
2. **Service Health:** Script to check/Restart-Service for critical services; output to CSV/JSON.
3. **Log Export:** Pull relevant Windows Event Logs and rotate archives.
4. **Scheduling:** Configure Task Scheduler with least-privilege account; export `.xml` tasks.
5. **Stretch:** Use Python (paramiko/netmiko) to back up network device configs.

## Deliverables
- `scripts/` — `.ps1` scripts and Task Scheduler XML
- `logs/` — Transcript/log outputs
- `README.md` — Usage, parameters, and validation notes

## Validation Checklist
- [ ] Patching transcript shows successful KB installs
- [ ] Service script handles stopped/failed services and logs actions
- [ ] Scheduled tasks run under least privilege and produce outputs
