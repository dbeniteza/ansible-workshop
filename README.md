# Ansible Workshop

![GitHub Workflow](https://github.com/dbeniteza/ansible-workshop/actions/workflows/ansible-validation.yml/badge.svg)
![GitHub License](https://img.shields.io/github/license/dbeniteza/ansible-workshop)
![GitHub Last Commit](https://img.shields.io/github/last-commit/dbeniteza/ansible-workshop)
![GitHub Issues](https://img.shields.io/github/issues/dbeniteza/ansible-workshop)
![Ansible](https://img.shields.io/badge/Ansible-Automation-red?logo=ansible)
![AWX](https://img.shields.io/badge/AWX-Automation%20Controller-orange)
![Kubernetes](https://img.shields.io/badge/Kubernetes-Labs-326CE5?logo=kubernetes&logoColor=white)
![Podman](https://img.shields.io/badge/Podman-Containerized%20Labs-892CA0?logo=podman&logoColor=white)


Comprehensive Ansible workshop covering inventories, playbooks, variables, templates, roles, collections, Ansible Navigator, Automation Controller, RBAC, workflows, and hands-on labs.

## Audience

- Linux Administrators
- System Engineers
- DevOps Engineers
- Platform Engineers
- IT Operations Teams

## Learning Objectives

By the end of this workshop you will be able to:

- Create and manage Ansible inventories
- Write and execute playbooks
- Use variables and facts
- Implement conditionals, loops, and handlers
- Create reusable templates
- Work with collections and roles
- Use Ansible Navigator
- Understand Execution Environments
- Use Automation Controller fundamentals
- Implement RBAC and workflows

## Repository Structure

| Folder | Description |
|----------|-------------|
| docs | Workshop guides and setup instructions |
| examples | Working examples for each topic |
| exercises | Hands-on labs |
| solutions | Lab solutions |
| playbooks | Demonstration playbooks |
| roles | Reusable Ansible roles |
| templates | Jinja2 templates |
| inventory | Inventories and variables |

## Prerequisites

- Basic Linux knowledge
- SSH access to managed hosts
- Ansible Core >= 2.15
- Git

## Getting Started

Clone the repository:

```bash
git clone https://github.com/dbeniteza/ansible-workshop.git
cd ansible-workshop
```

Check Ansible installation:

```bash
ansible --version
```

Run a sample playbook:

```bash
ansible-playbook -i inventory/inventory.ini playbooks/apache.yml
```

## Quick Start

This workshop provides a fully containerized learning environment using Podman.

### Start the Local Lab

```bash
cd deployment/lab-environment

podman-compose up -d
```

Access the Ansible controller:

```bash
podman exec -it ansible-controller bash
```

Verify connectivity:

```bash
ansible all -m ping
```

Run a sample playbook:

```bash
ansible-playbook playbooks/ping.yml
```

### Lab Environment Architecture

The local lab consists of:

- 1 Ansible Control Node
- 2 Managed Linux Nodes
- Preconfigured Inventory
- Shared Workshop Repository

```text
┌─────────────────────┐
│ Ansible Controller  │
└──────────┬──────────┘
           │ SSH
           │
  ┌────────┴────────┐
  │                 │
┌─▼──────┐     ┌────▼───┐
│ Node 1 │     │ Node 2 │
└────────┘     └────────┘
```

---

## Enterprise Automation Labs

The enterprise section of the workshop uses AWX.

AWX is the upstream open-source project for Red Hat Ansible Automation Platform and provides:

- Web User Interface
- Projects
- Inventories
- Credentials
- Job Templates
- Surveys
- RBAC
- Workflows

The deployment manifests are available under:

```text
deployment/awx
```

### Deploy AWX

```bash
kubectl apply -f deployment/awx/namespace.yaml

kubectl apply -f \
https://raw.githubusercontent.com/ansible/awx-operator/devel/deploy/awx-operator.yaml

kubectl apply -f deployment/awx/awx.yaml
```

Retrieve the admin password:

```bash
kubectl get secret awx-admin-password \
  -n awx \
  -o jsonpath="{.data.password}" | base64 -d
```

## Workshop Modules

### Module 1 - Ansible Fundamentals

- Inventory
- Modules
- Playbooks

### Module 2 - Variables and Facts

- Variables
- Facts
- Debugging

### Module 3 - Advanced Playbook Logic

- Conditionals
- Loops
- Handlers

### Module 4 - Templates

- Jinja2
- Dynamic configuration generation

### Module 5 - Collections

- Ansible Galaxy
- Custom collections

### Module 6 - Ansible Navigator

- Execution Environments
- Troubleshooting

### Module 7 - Automation Controller

- Projects
- Inventories
- Credentials
- Job Templates
- RBAC
- Workflows

## Contributing

Pull requests are welcome for improvements, bug fixes, and additional exercises.

## License

MIT
