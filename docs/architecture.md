# AWS Infrastructure Architecture

This lab environment simulates a production-like DevSecOps pipeline using AWS Cloud services.

## Components
1. **Scanner Node (EC2 - Ubuntu 22.04)**
   - Role: Automation Orchestrator
   - Tools: OpenSCAP, OWASP ZAP (running as systemd service)
   - Configuration: SSH-hardened access to the target node.

2. **Target Node (EC2 - Ubuntu 22.04)**
   - Role: Application Server
   - Application: WebGoat (running via systemd)
   - Compliance: Audited via CIS Level 1 benchmarks using OpenSCAP.

## Security Configuration
- **Network**: Security Groups restricted to necessary ports (22, 8080, 8090).
- **Service Persistence**: Both WebGoat and ZAP are managed via systemd to ensure they restart automatically on system reboot[cite: 9].
