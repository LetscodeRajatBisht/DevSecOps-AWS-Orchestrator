# DevSecOps-AWS-Orchestrator

# DevSecOps & Compliance Orchestrator

## Project Overview
This project demonstrates an automated security pipeline built on **AWS**. By architecting a multi-tier environment, I implemented continuous security monitoring, shifting security "left" by integrating automated scanning tools into the development workflow[cite: 6, 8, 9]. 

Read the full narrative and strategy behind this lab on Medium: [Insert Link to your Medium Article Here]

## AWS Infrastructure
The lab environment consists of two AWS EC2 instances running Ubuntu 22.04:
* **Scanner Instance**: The orchestrator node running automated security scanning tools (OpenSCAP, ZAP).
* **Target Instance**: A hardened instance hosting **WebGoat**, acting as the vulnerable testbed.
* **Connectivity**: Configured via secure SSH keys with automated background service management using `systemd`.

## Governance & Compliance (GRC) Integration
Automated scans are mapped to remediation workflows, ensuring vulnerabilities are tracked and addressed[cite: 6, 8, 9].

| Tool | Vulnerability | Severity | Status | Remediation Date |
| :--- | :--- | :--- | :--- | :--- |
| OpenSCAP | SSH Configuration | High | Resolved | 2026-05-20 |
| Snyk | Outdated Dependency | Medium | Resolved | 2026-05-22 |
| OWASP ZAP | Missing Security Header | Low | In Progress | 2026-05-28 |

## Technical Stack
* **Cloud:** AWS (EC2, VPC, Security Groups)
* **Automation:** Bash, systemd, cron
* **Security Tools:** Snyk (SAST/SCA), OWASP ZAP (DAST), OpenSCAP (Compliance)
