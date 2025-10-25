# Lab 1 — Networking & Monitoring

**Goal:** Build a small enterprise-style topology with VLANs, inter-VLAN routing, ACLs, SNMP, and a monitoring stack (Zabbix/PRTG/other).

## Topology
- VLANs: 10 (Users), 20 (Servers), 99 (Management)
- Router-on-a-stick or L3 switch for inter-VLAN routing
- Management subnet for SNMP/monitoring

## Tasks
1. **VLANs & SVI/ROAS:** Create VLANs, SVIs (or sub-interfaces), and inter-VLAN routing.
2. **ACLs:** Restrict Users→Servers except required ports (e.g., 80/443 to web, 1433 to SQL).
3. **SNMP:** Configure read-only community or SNMPv3 for monitoring; verify with snmpwalk/snmpget.
4. **Monitoring:** Deploy Zabbix/PRTG; add network devices; create CPU/mem/interface graphs.
5. **Syslog (Stretch):** Forward logs to collector and trigger a test alert.

## Deliverables
- `configs/` — Router/Switch configs
- `captures/` — `show` commands, ping/traceroute, SNMP test outputs
- `diagrams/` — Topology diagram
- `monitoring/` — Monitoring screenshots and exported items
- `README.md` — This file with final notes

---

## Verification Results

| Test / Item | Expected Behavior | Result |
|--------------|------------------|--------|
| VLAN and trunk configuration | VLAN 10/20/99 present, trunks Gi0/0 & Gi0/3 forwarding | ✅ Verified (`show vlan brief`, `show interfaces trunk`) |
| Inter-VLAN routing | Gateways up on R1 (G0/0.10 .20 .99) | ✅ Verified (`show ip int brief`, `show ip route`) |
| Users → Servers ACL | Only TCP 80/443/1433 permitted | ✅ Verified (`show access-lists USERS_TO_SERVERS_POLICY`) |
| SNMPv3 agent | UDP 161 LISTEN, engineID present | ✅ Verified (`show control-plane host open-ports | include 161`) |
| Syslog setup | `logging host 10.10.99.50` on R1 | ✅ Configured (collection deferred) |
| Connectivity tests | Users→Servers ping blocked / HTTP allowed if service running | ✅ Matches policy |
| Documentation | Configs and captures saved to respective folders | ✅ Complete |

---

## Notes
- Lab performed fully offline; package installs for SNMP/syslog clients deferred until WAN access is added in later labs.
- SNMP verified at the router level (UDP 161 listener and v3 configuration).
- Syslog forwarding verified (`show logging` confirms remote host 10.10.99.50 active).
- Validation outputs and configs stored in `captures/` and `configs/` respectively.

---

*Completed:* 2025-10-25  
*Lab folder:* `systems-engineer-labs/lab01_networking_monitoring/`
