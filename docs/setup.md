# Workshop Setup Guide

## Overview

This workshop uses:

- Podman for local Ansible execution
- AWX for enterprise automation exercises
- Kubernetes for AWX deployment

The goal is to eliminate host installation dependencies and provide a consistent learning environment.

---

# Prerequisites

## Local Workstation

Required software:

- Git
- Podman
- SSH Client
- Kubectl (for AWX labs)
- Access to a Kubernetes cluster (optional)

Verify installation:

```bash
git --version
podman --version
kubectl version --client
```

---

# Option 1 - Local Ansible Environment (Recommended)

Instead of installing Ansible directly on your workstation, use a containerized environment.

## Pull Container Image

```bash
podman pull quay.io/ansible/creator-ee:latest
```

## Start Container

```bash
podman run --rm -it \
  -v $(pwd):/workspace:z \
  -w /workspace \
  quay.io/ansible/creator-ee:latest \
  bash
```

Verify Ansible:

```bash
ansible --version
ansible-playbook --version
ansible-navigator --version
```

---

# Inventory Verification

Example inventory:

```ini
[linux]
server1 ansible_host=192.168.1.100
server2 ansible_host=192.168.1.101

[linux:vars]
ansible_user=student
```

Test connectivity:

```bash
ansible all -i inventory/inventory.ini -m ping
```

Expected output:

```json
SUCCESS
```

---

# Running Playbooks

Run a playbook:

```bash
ansible-playbook \
  -i inventory/inventory.ini \
  playbooks/apache.yml
```

---

# Ansible Navigator

Run using Navigator:

```bash
ansible-navigator run \
  playbooks/apache.yml \
  -i inventory/inventory.ini
```

Text output mode:

```bash
ansible-navigator run \
  playbooks/apache.yml \
  -i inventory/inventory.ini \
  -m stdout
```

---

# Workshop Exercises

Exercises are located in:

```text
exercises/
```

Solutions are located in:

```text
solutions/
```

Attempt each exercise before viewing the solution.

---

# Enterprise Automation Labs

The enterprise automation section uses AWX.

AWX is the upstream open-source project for Red Hat Ansible Automation Platform.

Topics covered:

- Inventories
- Credentials
- Projects
- Job Templates
- Surveys
- RBAC
- Workflows

---

# Kubernetes Requirements

Minimum recommended cluster:

- Kubernetes >= 1.28
- 4 CPU
- 8GB RAM
- StorageClass available

Supported distributions:

- Kind
- K3s
- Minikube
- AKS
- OpenShift

---

# Deploying AWX

Create namespace:

```bash
kubectl create namespace awx
```

Install AWX Operator:

```bash
kubectl apply -f https://raw.githubusercontent.com/ansible/awx-operator/devel/deploy/awx-operator.yaml
```

Wait for operator:

```bash
kubectl get pods -n awx
```

Deploy AWX:

```yaml
apiVersion: awx.ansible.com/v1beta1
kind: AWX
metadata:
  name: awx
  namespace: awx

spec:
  service_type: NodePort
  projects_persistence: true
  projects_storage_size: 5Gi
```

Save as:

```text
awx.yaml
```

Deploy:

```bash
kubectl apply -f awx.yaml
```

Check status:

```bash
kubectl get pods -n awx
```

Retrieve admin password:

```bash
kubectl get secret awx-admin-password \
  -n awx \
  -o jsonpath="{.data.password}" | base64 -d
```

Get service:

```bash
kubectl get svc -n awx
```

Open AWX in your browser.

---

# Troubleshooting

## Unable to reach hosts

Verify:

```bash
ansible all -m ping -i inventory/inventory.ini
```

Check:

- SSH access
- Firewall rules
- Inventory entries

## Playbook Syntax Errors

Validate before execution:

```bash
ansible-playbook playbook.yml --syntax-check
```

## Navigator Issues

Verify execution environment:

```bash
ansible-navigator images
```

## Kubernetes Issues

Check operator logs:

```bash
kubectl logs deployment/awx-operator-controller-manager -n awx
```

---

# Next Steps

After completing the workshop:

- Build reusable roles
- Create collections
- Use GitOps workflows
- Explore Event-Driven Ansible
- Deploy production-grade AWX/AAP environments