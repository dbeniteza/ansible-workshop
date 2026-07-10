# AWX Deployment on AKS

This directory contains the resources required to deploy:

- AWX Operator
- AWX 24.6.1
- PostgreSQL (Bitnami Helm Chart)
- Azure LoadBalancer exposure

The deployment is designed for AKS and intentionally uses an external PostgreSQL instance because the operator-managed PostgreSQL experienced persistent volume permission issues on AKS.

---

# Architecture

```text
AKS
│
├── Namespace: awx
│
├── AWX Operator
│
├── AWX Web
│
├── AWX Task
│
├── PostgreSQL (Bitnami)
│
└── Azure LoadBalancer
       │
       └── AWX Web UI
```

---

# Prerequisites

- AKS cluster
- kubectl configured
- Helm installed
- Cluster admin permissions

Verify access:

```bash
kubectl cluster-info
```

---

# Install AWX Operator

Deploy the operator and CRDs:

```bash
kubectl apply -k .
```

Expected output:

```text
namespace/awx created
customresourcedefinition.apiextensions.k8s.io/awxs.awx.ansible.com created
serviceaccount/awx-operator-controller-manager created
deployment.apps/awx-operator-controller-manager created
```

Verify CRDs:

```bash
kubectl get crd | grep awx
```

Expected:

```text
awxbackups.awx.ansible.com
awxmeshingresses.awx.ansible.com
awxrestores.awx.ansible.com
awxs.awx.ansible.com
```

---

# Known Issue: Operator Managed PostgreSQL on AKS

When using the default AWX Operator PostgreSQL deployment:

```text
awx-postgres-15-0
```

the pod may fail with:

```text
mkdir: cannot create directory '/var/lib/pgsql/data/userdata': Permission denied
```

This occurred using:

```text
Azure Disk
Azure Files
quay.io/sclorg/postgresql-15-c9s
```

Even after:

- PVC binding succeeded
- StorageClasses were configured
- fsGroup patches were applied

PostgreSQL remained unusable.

For this reason, the recommended deployment uses:

```text
Bitnami PostgreSQL
```

instead of the AWX-managed PostgreSQL.

---

# Install PostgreSQL

Add the Bitnami repository:

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
```

Update repositories:

```bash
helm repo update
```

Create the namespace if it does not already exist:

```bash
kubectl create -f ns.yaml
```

Install PostgreSQL:

```bash
helm install postgres bitnami/postgresql \
  --namespace awx \
  --set auth.username=awx \
  --set auth.password=awxpass \
  --set auth.database=awx
```

Verify:

```bash
kubectl get pods -n awx
```

Expected:

```text
postgres-postgresql-0   1/1 Running
```

Verify services:

```bash
kubectl get svc -n awx
```

Expected:

```text
postgres-postgresql
postgres-postgresql-hl
```

---

# Test PostgreSQL

Connect to PostgreSQL:

```bash
kubectl exec -it postgres-postgresql-0 -n awx -- bash
```

Inside the pod:

```bash
psql -U awx -d awx
```

Expected:

```sql
awx=>
```

Exit:

```sql
\q
```

---

# Create External Database Secret

IMPORTANT

When using Bitnami PostgreSQL, the value:

```text
type=unmanaged
```

is mandatory.

If:

```text
type=managed
```

is used, AWX will deploy its own PostgreSQL StatefulSet:

```text
awx-postgres-15
```

and ignore the external Bitnami PostgreSQL instance.

Create the secret:

```bash
kubectl create secret generic awx-postgres-configuration \
  -n awx \
  --from-literal=host=postgres-postgresql \
  --from-literal=port=5432 \
  --from-literal=database=awx \
  --from-literal=username=awx \
  --from-literal=password=awxpass \
  --from-literal=sslmode=prefer \
  --from-literal=type=unmanaged
```

Verify:

```bash
kubectl get secret awx-postgres-configuration -n awx
```

---

# Deploy AWX

Deploy the custom resource:

```bash
kubectl apply -f awx.yaml
```

Expected:

```text
awx.awx.ansible.com/awx created
```

Verify:

```bash
kubectl get awx -n awx
```

Expected:

```text
NAME
awx
```

---

# Monitor Deployment

Watch the pods:

```bash
kubectl get pods -n awx -w
```

Expected final state:

```text
awx-migration-24.6.1-xxxxx      Completed

awx-task-xxxxxxxxxxxx           4/4 Running

awx-web-xxxxxxxxxxxx            3/3 Running

postgres-postgresql-0           1/1 Running
```

Example:

```text
awx-migration-24.6.1-zcdbs      Completed
awx-task-655989f848-7nrfd       4/4 Running
awx-web-7cb5d6dc94-8kdtb        3/3 Running
postgres-postgresql-0           1/1 Running
```

---

# Retrieve the Admin Password

```bash
kubectl get secret awx-admin-password \
  -n awx \
  -o jsonpath="{.data.password}" | base64 -d

echo
```

Example:

```text
TSwl0LM7j1fK6hey1Oz05Ro4rlSp02hJ
```

---

# Access the AWX Console

Check the service:

```bash
kubectl get svc -n awx
```

Example:

```text
awx-service   LoadBalancer   XXX.XXX.XXX.XXX
```

Access:

```text
http://XXX.XXX.XXX.XXX
```

Login:

```text
Username: admin
Password: <awx-admin-password>
```

---

# Verify DNS Resolution to Lab Nodes

Verify AWX can resolve Kubernetes services:

```bash
kubectl exec -it deploy/awx-task -n awx -- \
getent hosts node1.ansible-lab.svc.cluster.local

kubectl exec -it deploy/awx-task -n awx -- \
getent hosts node2.ansible-lab.svc.cluster.local
```

Expected:

```text
10.x.x.x node1.ansible-lab.svc.cluster.local
10.x.x.x node2.ansible-lab.svc.cluster.local
```

---

# AWX Inventory Configuration

Create Inventory:

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

Note:

AWX does not automatically create Host objects from Inventory Variables.

Hosts must be created manually:

```text
Inventory
 ├── node1
 └── node2
```

Host Variables example:

```yaml
ansible_host: node1.ansible-lab.svc.cluster.local
```

and:

```yaml
ansible_host: node2.ansible-lab.svc.cluster.local
```

---

# Restrict Public Access

AWX is exposed through an Azure Load Balancer:

```text
http://XXX.XXX.XXX.XXX
```

To restrict access to your workstation only:

Determine your public IP:

```cmd
curl ifconfig.me
```

Example:

```text
YYY.YYY.YYY.YYY
```

Apply:

```bash
kubectl patch svc awx-service -n awx --type merge -p '
{
  "spec": {
    "loadBalancerSourceRanges": [
      "YYY.YYY.YYY.YYY/32"
    ]
  }
}'
```

Verify:

```bash
kubectl get svc awx-service -n awx -o yaml | grep -A5 loadBalancerSourceRanges
```

Expected:

```yaml
loadBalancerSourceRanges:
- YYY.YYY.YYY.YYY/32
```

Only clients originating from that public IP should be able to access AWX.

---

# Lessons Learned

## 1. Operator CRDs are not enough

Successful CRD installation:

```bash
kubectl get crd | grep awx
```

does not mean AWX is running.

The AWX Operator deployment must also be running.

---

## 2. Operator Sidecar Failure Is Not Fatal

The operator often showed:

```text
1/2 ImagePullBackOff
```

because:

```text
gcr.io/kubebuilder/kube-rbac-proxy:v0.15.0
```

could not be pulled.

The main operator container still functioned correctly and successfully deployed AWX.

---

## 3. Do Not Use `type=managed` With External PostgreSQL

Incorrect:

```text
type=managed
```

Result:

```text
awx-postgres-15
```

is deployed by AWX.

Correct:

```text
type=unmanaged
```

Result:

```text
Bitnami PostgreSQL is used.
```

---

## 4. Bitnami PostgreSQL Is More Reliable on AKS

The AWX-managed PostgreSQL repeatedly failed with:

```text
Permission denied
```

on mounted storage.

Bitnami PostgreSQL worked immediately.

---

## 5. ReadWriteMany Is Required

Using:

```yaml
projects_storage_access_mode: ReadWriteOnce
```

caused:

```text
Multi-Attach error
```

between:

```text
awx-web
awx-task
```

The projects volume must support:

```yaml
projects_storage_access_mode: ReadWriteMany
```

---

## 6. Kubernetes DNS Works Well Across Namespaces

AWX pods successfully resolved:

```text
node1.ansible-lab.svc.cluster.local
node2.ansible-lab.svc.cluster.local
```

without additional networking changes.

---

# Cleanup

Remove AWX:

```bash
kubectl delete awx awx -n awx
```

Remove PostgreSQL:

```bash
helm uninstall postgres -n awx
```

Remove namespace:

```bash
kubectl delete namespace awx
```