# Solution - Exercise 08

## Concepts Covered

- AWX User Interface
- Core Objects
- Automation Lifecycle
- Execution Environments

---

## Organization

An Organization is a logical container used to group:

- Users
- Teams
- Projects
- Inventories
- Credentials

Organizations help separate environments and responsibilities.

Example:

```text
Production

Development

Workshop
```

---

## Inventory

An Inventory defines the systems managed by automation.

Examples:

```text
web01
web02
db01
```

Inventories may be:

- Static
- Dynamic

---

## Credential

Credentials provide access to resources.

Examples:

```text
SSH Key

Username/Password

Vault Secret

Cloud Credential
```

Credentials are stored securely and are never exposed inside playbooks.

---

## Project

A Project contains automation content.

Most commonly:

```text
Git Repository
```

Example:

```text
https://github.com/company/ansible-workshop
```

A Project provides:

- Playbooks
- Roles
- Collections
- Templates

to the Automation Controller.

---

## Job Template

A Job Template combines:

```text
Inventory
+
Credential
+
Project
+
Playbook
```

into an executable automation job.

Example:

```text
Project:
  ansible-workshop

Inventory:
  Workshop Lab

Credential:
  Workshop SSH

Playbook:
  apache.yml
```

When launched, AWX executes the automation.

---

## Execution Environment

Execution Environments are container images containing:

- Ansible Core
- Collections
- Python Dependencies

Examples:

```text
quay.io/ansible/creator-ee

ee-supported-rhel8
```

The same concept was introduced earlier using Ansible Navigator.

---

## Automation Flow

```text
Git Repository
       |
       v
    Project
       |
       v
    Playbook
       |
       v
 Credential
       |
       v
 Inventory
       |
       v
 Job Template
       |
       v
Execution Environment
       |
       v
 Managed Hosts
```

---

## Key Takeaways

Automation Controller does not replace Ansible.

Instead, it provides:

- Centralized execution
- Access control
- Scheduling
- Auditing
- Collaboration
- Governance

The actual automation is still performed by Ansible playbooks executed inside an Execution Environment.
`