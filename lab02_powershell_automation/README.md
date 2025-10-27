# Lab 2 — PowerShell Basics for Systems Engineers (Guided Exercise)

**Environment:** Windows Server 2019 VM (Administrator PowerShell session)  
**Goal:** Learn PowerShell scripting fundamentals — creating folders, writing basic scripts, exporting logs, and capturing documentation.  
**Outcome:** Three working scripts, timestamped outputs, and screenshots.

---

## 0️⃣ Environment Setup

### Commands
```powershell
$PSVersionTable.PSVersion
whoami
New-Item -ItemType Directory -Force -Path "C:\Lab02_Basics\Scripts","C:\Lab02_Basics\Logs" | Out-Null
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
Get-ExecutionPolicy -List > C:\Lab02_Basics\Logs\executionpolicy.txt
```

### Deliverables
- **executionpolicy.txt** → copy to `captures/`
- **Screenshots:**
  - `ps_version_user.png` — shows PowerShell version + user
  - `folder_structure.png` — shows C:\Lab02_Basics with Scripts/Logs
  - `executionpolicy_set.png` — shows Get-ExecutionPolicy results

---

## 1️⃣ Script 1 — List Services → CSV

### Run
```powershell
C:\Lab02_Basics\Scripts\list_services.ps1
```
✅ Output: `Saved: C:\Lab02_Basics\Logs\services_YYYYMMDD_HHMMSS.csv`

### Deliverables
- **services_sample.csv** → copy to `logs/`
- **Screenshots:**
  - `listservices_console.png` — PowerShell showing “Saved:” line
  - `listservices_file.png` — Explorer showing new CSV in Logs

---

## 2️⃣ Script 2 — Event Log Summary → TXT

### Run
```powershell
C:\Lab02_Basics\Scripts\eventlog_summary.ps1 -Hours 24
```
✅ Output: `Saved: C:\Lab02_Basics\Logs\eventlog_summary_YYYYMMDD_HHMMSS.txt`

### Deliverables
- **eventlog_summary_sample.txt** → copy to `logs/`
- **Screenshots:**
  - `eventlog_console.png` — PowerShell showing “Saved:” line
  - `eventlog_file.png` — Notepad showing first few lines of log

---

## 3️⃣ Script 3 — Ping Test → CSV + JSON

### Run
```powershell
C:\Lab02_Basics\Scripts\ping_test.ps1 -Hosts 8.8.8.8,1.1.1.1
```
✅ Output:
```
Saved: C:\Lab02_Basics\Logs\ping_results_YYYYMMDD_HHMMSS.csv
Saved: C:\Lab02_Basics\Logs\ping_results_YYYYMMDD_HHMMSS.json
```

### Deliverables
- **ping_results_sample.csv** and **ping_results_sample.json** → copy to `logs/`
- **Screenshots:**
  - `pingtest_console.png` — PowerShell output showing both “Saved:” lines
  - `pingtest_files.png` — Explorer showing both files in Logs
  - `pingtest_csv.png` — optional, CSV opened showing True/False reachability

---

## 4️⃣ Verification & Structure

### Validate
```powershell
Get-ChildItem C:\Lab02_Basics\Logs | Sort LastWriteTime -Desc | Select Name,Length,LastWriteTime
```
📸 Screenshot: `logs_summary.png` — show all log files listed in console

### Repo Folder Layout
```
lab02_powershell_automation/
├─ scripts/
│  ├─ list_services.ps1
│  ├─ eventlog_summary.ps1
│  └─ ping_test.ps1
├─ logs/
│  ├─ services_sample.csv
│  ├─ eventlog_summary_sample.txt
│  ├─ ping_results_sample.csv
│  └─ ping_results_sample.json
├─ captures/
│  ├─ executionpolicy.txt
│  └─ screenshots/
│     ├─ ps_version_user.png
│     ├─ folder_structure.png
│     ├─ executionpolicy_set.png
│     ├─ listservices_console.png
│     ├─ listservices_file.png
│     ├─ eventlog_console.png
│     ├─ eventlog_file.png
│     ├─ pingtest_console.png
│     ├─ pingtest_files.png
│     ├─ pingtest_csv.png
│     └─ logs_summary.png
└─ README.md
```

---

## 5️⃣ Commit & Push

### Commands
```bash
git add lab02_powershell_automation/scripts/*.ps1         lab02_powershell_automation/logs/*         lab02_powershell_automation/captures/*         lab02_powershell_automation/README.md
git commit -m "Lab 2 – PowerShell Basics (Guided): services, event logs, and ping test with outputs and screenshots"
git push origin main
```

---

## 6️⃣ Verification Table

| Script | Output | Verified | Screenshot(s) |
|--------|---------|-----------|----------------|
| list_services.ps1 | CSV | ✅ | listservices_console.png, listservices_file.png |
| eventlog_summary.ps1 | TXT | ✅ | eventlog_console.png, eventlog_file.png |
| ping_test.ps1 | CSV + JSON | ✅ | pingtest_console.png, pingtest_files.png, pingtest_csv.png |
| Execution Policy + Folder | executionpolicy.txt | ✅ | ps_version_user.png, folder_structure.png, executionpolicy_set.png |
| Log Summary | log listing | ✅ | logs_summary.png |

---

> **Learning Note:**  
> This lab was completed as a guided exercise to learn PowerShell basics.  
> Scripts were created step-by-step with detailed explanations, outputs, and screenshots for reproducibility.