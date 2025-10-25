# Systems Engineer Labs

This repository is a **hands-on lab series** demonstrating readiness for an IT Systems / Infrastructure Engineer role. 
It covers networking, monitoring, automation, compliance hardening, and infrastructure familiarity. 
Each lab includes configs, scripts, verification outputs, and screenshots.

> Status: **Scaffolded** — start with Lab 1.

## Labs (Overview)
- **Lab 1 — Networking & Monitoring:** VLANs, inter-VLAN routing, ACLs, SNMP, and monitoring dashboards.
- **Lab 2 — Automation & Scripting (PowerShell):** Patching, service management, and log export with Task Scheduler.
- **Lab 3 — Compliance & Security:** Apply CIS-aligned hardening on Windows Server; document before/after evidence.
- **Lab 4 — Infrastructure Familiarity:** Cabling standards (TIA-568), IP surveillance network segmentation, and monitoring considerations.
- **Lab 5 — Portfolio Integration:** Final packaging, screenshots, repo cleanup.

## Suggested Weekly Plan
- **Week 1:** Lab 1 – Network topology (CML/EVE-NG/GNS3) — 8–10 hours  
- **Week 2:** Lab 1 – Monitoring extension — 6–8 hours  
- **Week 3:** Lab 2 – PowerShell automation — 8 hours  
- **Week 4:** Lab 3 – Compliance & hardening — 8–10 hours  
- **Week 5:** Lab 4 – Infrastructure familiarity — 6–8 hours  
- **Week 6:** Lab 5 – Portfolio integration — 6–8 hours

> Accelerated track: ~35–40 hours over ~3–4 weeks.

## Repository Structure
```
.
├─ lab01_networking_monitoring/
│  ├─ configs/           # Router/Switch configs
│  ├─ diagrams/          # draw.io or PNGs
│  ├─ monitoring/        # dashboard exports, screenshots
│  ├─ captures/          # show commands, test results
│  └─ README.md
├─ lab02_powershell_automation/
│  ├─ scripts/           # .ps1 files
│  ├─ logs/              # task outputs, transcripts
│  └─ README.md
├─ lab03_compliance_security/
│  ├─ checklists/        # CIS items implemented
│  ├─ reports/           # scans, PS exports
│  └─ README.md
├─ lab04_infra_familiarity/
│  ├─ diagrams/
│  ├─ notes/
│  └─ README.md
├─ lab05_portfolio_integration/
│  └─ README.md
├─ docs/                 # Shared docs (topologies, templates)
├─ scripts/              # Helpers (capture/export, validation)
├─ .gitignore
└─ LICENSE
```

## Getting Started
1. Clone this repo locally.
2. Start with **lab01_networking_monitoring/README.md** and follow the step-by-step tasks.
3. Commit frequently; include verification outputs in `captures/` and screenshots in `diagrams/` or `monitoring/`.

## Notes
- Tools assumed: **VMware Workstation + Cisco Modeling Labs (CML)**, or EVE‑NG/GNS3; Windows Server VM; monitoring stack; PowerShell 7.
- Substitute equivalent tools if needed; document changes in each lab README.

---
*Generated scaffold: 2025-10-24 23:52 *
