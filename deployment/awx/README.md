# AWX Deployment

This directory contains Kubernetes manifests for deploying AWX.

AWX is the upstream open-source project for Red Hat Ansible Automation Platform (AAP).

---

## Architecture

```text
Kubernetes Cluster
│
├── AWX Operator
│
├── PostgreSQL
│
└── AWX
    ├── Web UI
    └── Task Execution Pods
```

---

## Requirements

Minimum:

- Kubernetes 1.28+
- Default StorageClass
- 4 vCPU
- 8 GB RAM

Supported:

- K3s
- Kind
- Minikube
- AKS
- OpenShift

---

## Installation

### Create Namespace

```bash
kubectl apply -f namespace.yaml
```

### Install AWX Operator

```bash
kubectl apply -f \
https://raw.githubusercontent.com/ansible/awx-operator/devel/deploy/awx-operator.yaml
```

Verify:

```bash
kubectl get pods -n awx
```

### Deploy AWX

```bash
kubectl apply -f awx.yaml
```

Check status:

```bash
kubectl get pods -n awx -w
```

---

## Retrieve Admin Password

```bash
kubectl get secret awx-admin-password \
  -n awx \
  -o jsonpath="{.data.password}" | base64 -d
```

---

## Retrieve Service Information

```bash
kubectl get svc -n awx
```

---

## Login

Username:

```text
admin
```

Password:

Use the command above.

---

## Workshop Exercises Using AWX

### Exercise 2.1

- Controller Introduction

### Exercise 2.2

- Inventories
- Credentials

### Exercise 2.3

- Projects
- Job Templates

### Exercise 2.4

- Surveys

### Exercise 2.5

- RBAC

### Exercise 2.6

- Workflows

---

## Cleanup

Remove AWX:

```bash
kubectl delete -f awx.yaml
```

Remove Namespace:

```bash
kubectl delete namespace awx
```