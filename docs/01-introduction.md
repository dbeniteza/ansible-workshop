# Introduction to Ansible

## What is Ansible?

Ansible is an open-source automation platform that allows you to automate:

- Server configuration
- Application deployment
- Infrastructure provisioning
- Security and compliance tasks
- Operational procedures

Ansible uses a simple, human-readable language based on YAML.

## Why Ansible?

Benefits include:

- Agentless architecture
- Low learning curve
- Easy to read and maintain
- Large ecosystem
- Cross-platform support

## How Ansible Works

Ansible connects to managed systems using SSH.

```text
Control Node
      |
      | SSH
      |
+-----+-----+
|           |
Host A    Host B
```

The control node executes automation against managed hosts.

## Core Components

### Inventory

The list of managed systems.

### Modules

Reusable automation units.

### Tasks

Individual automation steps.

### Playbooks

Collections of tasks executed against hosts.

### Roles

Reusable automation structures.

### Collections

Packages containing automation content.

## Typical Workflow

1. Create inventory
2. Create playbook
3. Execute playbook
4. Verify results