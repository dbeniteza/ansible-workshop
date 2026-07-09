# Next Steps

Congratulations on completing the Ansible Workshop.

You have learned the foundations of Ansible automation as well as how to manage automation at scale using AWX/Automation Controller.

This document outlines recommended next steps for continuing your automation journey.

---

# Recommended Learning Path

## Beginner

Focus on mastering:

- Inventories
- Playbooks
- Variables
- Facts
- Templates
- Roles

Practice:

- User management
- Package management
- Service management
- File deployment

---

## Intermediate

Focus on:

- Roles
- Collections
- Ansible Galaxy
- Ansible Navigator
- Execution Environments

Practice:

- Reusable automation
- Configuration management
- Enterprise project structures

---

## Advanced

Focus on:

- Automation Controller (AWX)
- RBAC
- Workflows
- Approval processes
- Automation governance

Practice:

- Multi-team automation
- Self-service automation
- Auditable deployments

---

# Event-Driven Ansible

Traditional Ansible is executed manually or on a schedule.

Event-Driven Ansible reacts automatically to events.

Examples:

- Server becomes unavailable
- Security alert generated
- Monitoring threshold exceeded
- New virtual machine created

Workflow:

```text
Event
   |
   v
Rulebook
   |
   v
Ansible Playbook
```

Typical use cases:

- Auto-remediation
- Incident response
- Security operations
- Operational automation

---

# Automation Mesh

Automation Mesh extends automation execution across multiple locations.

Example:

```text
Automation Controller
         |
         |
 +-------+-------+
 |               |
 v               v
Execution    Execution
Node East    Node West
```

Benefits:

- Geographic distribution
- Reduced latency
- Increased scalability
- Improved resilience

Typical use cases:

- Global enterprises
- Multi-cloud deployments
- Remote offices
- Edge computing

---

# Private Automation Hub

Private Automation Hub provides centralized storage for trusted automation content.

Stores:

- Collections
- Roles
- Execution Environments

Benefits:

- Version control
- Governance
- Trusted content
- Enterprise distribution

Example:

```text
Develop
   |
   v
Test
   |
   v
Publish
   |
   v
Automation Hub
   |
   v
Consumers
```

---

# GitOps and Ansible

GitOps uses Git as the source of truth.

Every infrastructure change begins with:

```text
Git Commit
```

Workflow:

```text
Developer
    |
    v
Git Repository
    |
    v
Pull Request
    |
    v
Approval
    |
    v
Automation Execution
```

Benefits:

- Auditability
- Change history
- Peer review
- Rollback capability

Recommended tools:

- GitHub
- GitLab
- Azure DevOps

---

# CI/CD Integration

Ansible can be integrated into CI/CD pipelines.

Typical workflow:

```text
Git Push
    |
    v
Pipeline
    |
    v
Lint
    |
    v
Test
    |
    v
Deploy
```

Recommended tools:

- GitHub Actions
- GitLab CI
- Jenkins
- Azure DevOps Pipelines

Useful commands:

```bash
ansible-lint

ansible-playbook --syntax-check

molecule test
```

---

# AWX vs AAP

## AWX

Open-source project.

Features:

- Automation Controller
- RBAC
- Workflows
- Projects
- Credentials

Best for:

- Learning
- Labs
- Community usage
- Small deployments

---

## Red Hat Ansible Automation Platform (AAP)

Enterprise product built from AWX.

Additional benefits:

- Vendor support
- Private Automation Hub
- Automation Analytics
- Certified content
- Enterprise lifecycle management

Best for:

- Production environments
- Large organizations
- Compliance requirements
- Enterprise support needs

---

# Infrastructure as Code

Expand your automation capabilities by combining Ansible with:

## Terraform

Provision:

- Virtual machines
- Networks
- Cloud resources

Then configure them using Ansible.

Example:

```text
Terraform
    |
    v
Provision Infrastructure
    |
    v
Ansible
    |
    v
Configure Systems
```

---

## Kubernetes

Learn:

- Kubernetes fundamentals
- Helm
- Operators
- GitOps

Automate:

- Application deployment
- Cluster configuration
- Day-2 operations

---

# Suggested Personal Projects

## Beginner

### NGINX Web Server

Create automation that:

- Installs NGINX
- Starts the service
- Enables it on boot
- Deploys a custom homepage

Topics:

- Playbooks
- Variables
- Templates
- Handlers

---

### Linux User Onboarding

Create automation that:

- Creates users
- Creates groups
- Configures SSH keys

Topics:

- Loops
- Variables
- User management

---

## Intermediate

### Multi-Site NGINX Platform

Deploy multiple websites using a single role.

Example:

```yaml
sites:
  - site1
  - site2
  - site3
```

Topics:

- Roles
- Templates
- Variables
- Loops

---

### Automated Patch Management

Create automation that:

- Checks updates
- Applies patches
- Reboots when required
- Validates services after reboot

Topics:

- Facts
- Conditionals
- Handlers

---

### Container Deployment

Deploy a containerized application using Podman.

Topics:

- Collections
- Roles
- Service management

---

## Advanced

### AWX on Kubernetes

Deploy and configure AWX using Kubernetes.

Topics:

- AWX Operator
- Kubernetes
- Ingress
- Storage

---

### Self-Service Web Provisioning

Create an AWX workflow that:

- Receives user input through a Survey
- Deploys NGINX
- Creates a website automatically

Topics:

- Surveys
- RBAC
- Workflows

---

### GitOps Automation Platform

Build a Git-driven automation workflow:

```text
Git Commit
    |
    v
CI/CD Pipeline
    |
    v
AWX Project Sync
    |
    v
Deployment
```

Topics:

- GitOps
- CI/CD
- Automation Controller

---

# Certifications

## EX374

**Red Hat Certified Specialist in Developing Automation with Ansible Automation Platform**

Recommended after completing this workshop.

Topics:

- Playbooks
- Roles
- Collections
- Execution Environments
- Automation Controller

---

## DO374

**Developing Advanced Automation with Ansible Automation Platform**

Recommended training course before attempting EX374.

Covers:

- Advanced playbooks
- Roles and collections
- Automation Controller
- Enterprise automation practices

---

## Complementary Certifications

### Terraform Associate

Learn Infrastructure as Code provisioning and combine Terraform with Ansible.

---

### Certified Kubernetes Application Developer (CKAD)

Learn Kubernetes application deployment and operations.

---

### Certified Kubernetes Administrator (CKA)

Learn Kubernetes administration, cluster operations, and platform management.

---

### Microsoft Azure Administrator (AZ-104)

Useful if automating Azure infrastructure with Ansible.

---

### Azure DevOps Engineer (AZ-400)

Focuses on GitOps, CI/CD, pipelines, and automation practices frequently used alongside Ansible.