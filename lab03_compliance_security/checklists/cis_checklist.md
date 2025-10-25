# Windows Server Hardening — CIS-Aligned Checklist

| ID | Control/Setting | Baseline Evidence | Change Implemented | After Evidence | Mapping (AC/AU/CM/SI/IA/MP/etc.) | Notes |
|----|------------------|-------------------|--------------------|----------------|----------------------------------|-------|
| 1  | Account lockout threshold (e.g., 5) | `secedit /export` or `Get-ADDefaultDomainPasswordPolicy` | Set threshold to 5, reset to 15 min | Screenshot/Export | AC | |
| 2  | Minimum password length (e.g., 14) | Baseline export | Set to 14 | Screenshot/Export | IA | |
| 3  | Audit policy: Logon/Logoff success/failure | `auditpol /get /category:*` | Enabled success+failure | Screenshot/Export | AU | |
| 4  | Windows Firewall profiles enabled | `Get-NetFirewallProfile` | Enabled Domain/Private/Public | Screenshot/Export | CM/SI | |
| 5  | RDP: Network Level Authentication required | `Get-ItemProperty` for RDP settings | Enforce NLA | Screenshot/Export | AC | |
| 6  | SMB signing required | Check via registry/PowerShell | Enforce signing | Screenshot/Export | SI | |
| 7  | Disable anonymous SID/Name translation | Baseline export | Harden registry/policy | Screenshot/Export | AC | |
| 8  | Disable LM/NTLMv1 | Baseline export | NTLMv2 only | Screenshot/Export | IA/SI | |
| 9  | PowerShell script block logging | `Get-Item WSMan:\localhost\Shell\ScriptBlockLogging` | Enable | Screenshot/Export | AU | |
| 10 | Defender AV real-time + periodic scans | `Get-MpPreference` | Enable & schedule | Scan report | SI | |

> Replace/extend rows to match the specific CIS version you choose. Keep before/after evidence artifacts under `reports/`.
