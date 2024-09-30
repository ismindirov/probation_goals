# Monthly Summary Report

## Summary of Activities

### Week 1: Onboarding and Initial Setup
   - **Department Familiarization:**
     - Gained an understanding of the department's structure, roles, and responsibilities.
     - Reviewed the knowledge base in Confluence, focusing on DutyOps rules and emergency protocols.
   - **Team Integration:**
     - Attended the first team meeting and made notes to clarify roles and expectations.
     - Joined and reviewed all relevant Slack channels, documenting any unclear points for follow-up.
   - **Knowledge Base Review:**
     - Studied the work processes of key departments like Emergency IT Support and HelpDesk.
     - Understood the role and responsibilities of the Reliability Unit.
   - **Administrative Setup:**
     - Signed the company’s code of ethics.
     - Secured access to essential tools and services, including GitLab, 1Password, and Admin panels.
   - **Goal Setting:**
     - Planned to complete the mandatory information security test, read runbooks, and continue with DutyOps onboarding topics in the following week.

### Week 2: Initial Projects and Learning
   - **Mandatory Tasks:**
     - Successfully passed the information security test.
     - Completed reading runbooks, gaining insights into standard operating procedures and protocols.
     - Reviewed the list of product incidents and identified the teams responsible for resolving each issue.
   - **Project Initiation:**
     - Created and managed a personal project in Jira, breaking it down into specific tasks aimed at mastering key technologies.
     - Focused on practical projects to build a replication master-slave setup for databases like MongoDB and PostgreSQL, with plans to expand into high availability and failover clusters.
     - Studied networking specifics, including load balancing, and incorporated these into the project goals.
   - **Technical Architecture:**
     - Conducted an in-depth study of the technical architecture of the ecosystem using Confluence.
     - Developed a structured plan to master critical tools such as MongoDB, ClickHouse, Terraform, and Ansible.
     - Began implementing GitOps practices using GitLab in conjunction with IaC tools.

### Week 3: Database Management and Scripting
   - **Database Projects:**
     - **MongoDB:**
       - Developed a web application integrating frontend and backend with MongoDB, managed via Docker Compose.
       - Implemented comprehensive backup strategies, including full, incremental, and differential backups using `mongodump` and oplog.
     - **ClickHouse:**
       - Set up and studied ClickHouse, focusing on its high-performance analytical query capabilities.
       - Created a schema for sample datasets and ran performance tests to optimize query efficiency.
     - **PostgreSQL:**
       - Configured a Primary-Replica (Master-Slave) architecture using Docker.
       - Deployed backup strategies utilizing `pg_dump` and custom scripts for incremental backups.
     - **Redis:**
       - Configured a Redis Sentinel Cluster for high availability.
       - Developed backup strategies and tested Redis health and recovery processes.
   - **Scripting and Automation:**
     - Automated backup and restore processes across MongoDB, PostgreSQL, and Redis using a custom `script.sh`.
     - Scheduled regular backups with `cron`, ensuring reliability and consistency across environments.

### Week 4: Monitoring, NATS, and Duty Week
   - **Monitoring Setup:**
     - Gained proficiency with Zabbix, Grafana, and Prometheus, integrating these tools to monitor server performance.
     - Added hosts to the monitoring systems and configured alerts for critical metrics like CPU usage, memory consumption, and disk space.
     - Created custom dashboards in Grafana, providing a comprehensive view of system health and performance.
   - **NATS Cluster Management:**
     - Acquired in-depth knowledge of NATS, focusing on its architecture and communication patterns.
     - Successfully built and managed a NATS cluster, configuring it for high availability and fault tolerance.
     - Tested the NATS cluster under various scenarios to ensure reliability and performance.
   - **Nginx Configuration:**
     - Configured Nginx for virtual hosts, location blocks, and proxying to optimize server management.
     - Implemented SSL/TLS certificates for secure communication and set up rate limiting and access control to enhance security.
   - **Terraform Development:**
     - Continued developing Terraform skills, focusing on creating reusable and efficient modules.
     - Developed a personal Terraform module for the AWS ACM service, tested it, and documented usage examples.
     - Stored Terraform modules in GitLab and set up CI/CD pipelines for automated deployment and testing.
   - **First Duty Week:**
     - Gained hands-on experience with server management during the first week on duty, handling tasks related to server alerts and performance issues.
     - Created and assigned three tasks to the related department (@pduty) to improve automation and efficiency:
       - Two tasks focused on increasing disk space (PDEV-2768, PDEV-2740).
       - One task for automating the deletion of pprof files (PDEV-2768).
     - Interacted with all team members, providing positive feedback and identifying areas for process improvement, such as automating server maintenance and enhancing duty handover procedures.

---

Feel free to reach out if there are any questions or further clarifications needed.

Best regards,  
Vlad Ismindirov