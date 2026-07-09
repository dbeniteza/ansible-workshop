# Solution - Exercise 09

## Concepts Covered

- Inventories
- Host Groups
- Hosts
- Machine Credentials
- Variable Management

---

## Inventory

Created Inventory:

```text
Workshop Inventory
```

Purpose:

- Defines managed systems
- Organizes infrastructure
- Stores host and group variables

---

## Groups

Created:

```text
web
database
```

Group membership:

```text
web
└── node1

database
└── node2
```

Benefits:

- Easier targeting
- Shared variables
- Logical organization

---

## Hosts

Hosts added:

```text
node1

node2
```

Example host variables:

```yaml
ansible_host: node1
```

```yaml
ansible_host: node2
```

---

## Credential

Created Credential:

```text
Workshop SSH
```

Type:

```text
Machine
```

Authentication:

```text
Username: student
```

Using:

```text
Password

or

SSH Private Key
```

---

## Why Credentials Matter

Playbooks should never contain secrets.

Incorrect:

```yaml
password: redhat
```

Correct:

```text
Store credentials in AWX
```

Then reference them from Job Templates.

---

## Variable Hierarchy Example

Group variable:

```yaml
web_port: 80
```

Host variable:

```yaml
ansible_host: node1
```

AWX merges inventory information before execution.

---

## Preparing for the Next Exercise

The following objects now exist:

```text
✓ Inventory

✓ Hosts

✓ Groups

✓ Credential
```

Next we will create:

```text
Project

Job Template
```

to execute automation from AWX.

---

## Final Architecture

```text
Inventory
│
├── web
│   └── node1
│
└── database
    └── node2

Credential
│
└── Workshop SSH
```

These resources will be reused throughout the remaining AWX exercises.