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

## Ansible Workshop AKS Lab

This repository provides a complete AKS-based lab environment for the Ansible Workshop.

### Components

The lab deploys:

```text
AKS
│
├── ansible-controller
├── node1
├── node2
│
└── AWX (optional)
    ├── AWX Operator
    ├── AWX Web
    ├── AWX Task
    └── PostgreSQL
```

## Quick Start

### Deploy the Lab Nodes

```bash
kubectl apply -f deployment/aks-lab/
```

Verify:

```bash
kubectl get pods -n ansible-lab
```

Expected:

```text
ansible-controller
node1
node2
```

## Supported Workshop Exercises

Without AWX:

- Exercise 01 - Inventories and Playbooks
- Exercise 02 - Variables and Facts
- Exercise 03 - Conditionals, Loops and Handlers
- Exercise 04 - Templates
- Exercise 05 - Roles and Collections
- Exercise 06 - Ansible Navigator
- Exercise 07 - Debugging and Troubleshooting

With AWX:

- Exercise 08 - Controller Introduction
- Exercise 09 - Inventories and Credentials
- Exercise 10 - Projects and Job Templates
- Exercise 11 - Surveys and RBAC
- Exercise 12 - Workflows

## AWX Deployment

AWX deployment instructions are available in:

```text
deployment/awx/README.md
```

The documented approach uses:

```text
AWX Operator
+
Bitnami PostgreSQL
```

instead of the operator-managed PostgreSQL deployment.

This approach has been validated on AKS.

## AWX Architecture

```text
AKS
│
├── AWX Operator
├── AWX Web
├── AWX Task
├── Bitnami PostgreSQL
│
├── ansible-controller
├── node1
└── node2
```

## AWX Inventory

The AKS lab nodes can be managed directly from AWX.

Inventory example:

```yaml
all:
  hosts:
    node1:
      ansible_host: node1.ansible-lab.svc.cluster.local

    node2:
      ansible_host: node2.ansible-lab.svc.cluster.local

  vars:
    ansible_user: student
    ansible_password: redhat
    ansible_connection: ssh
```

Verify DNS resolution from AWX:

```bash
kubectl exec -it deploy/awx-task -n awx -- \
getent hosts node1.ansible-lab.svc.cluster.local

kubectl exec -it deploy/awx-task -n awx -- \
getent hosts node2.ansible-lab.svc.cluster.local
```

## Security

When exposing AWX through an Azure LoadBalancer, restrict access using:

```yaml
loadbalancer_source_ranges:
  - <your-public-ip>/32
```

Example:

```yaml
loadbalancer_source_ranges:
  - 162.125.43.52/32
```

This limits access to AWX from specific public IP addresses.

## Cleanup

```bash
kubectl delete namespace ansible-lab
kubectl delete namespace awx
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
