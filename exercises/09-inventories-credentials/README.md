# Exercise 09 - Inventories and Credentials

## Objective

Learn how to:

- Create an Inventory in AWX
- Create Host Groups
- Add Hosts
- Create Credentials
- Test connectivity from AWX to managed hosts

---

## Background

Before AWX can execute a playbook it must know:

- Which systems to manage
- How to authenticate

This information is stored in:

- Inventories
- Credentials

---

## Architecture

```text
AWX
 │
 ├── Inventory
 │     ├── node1
 │     └── node2
 │
 └── Credential
       └── SSH Access

             │
             ▼

       Managed Hosts
```

---

## Task 1 - Create an Inventory

Navigate to:

```text
Resources
→ Inventories
```

Create:

```text
Name:
Workshop Inventory
```

Organization:

```text
Default
```

Save the inventory.

---

## Task 2 - Create Host Groups

Inside the inventory create:

```text
web
database
```

---

## Task 3 - Add Hosts

Create:

```text
node1
node2
```

Assign:

```text
node1 -> web

node2 -> database
```

---

## Task 4 - Define Host Variables

Add variables for each host.

Example:

```yaml
ansible_host: node1
```

Repeat for node2.

Verify all hosts belong to the correct groups.

---

## Task 5 - Create a Machine Credential

Navigate to:

```text
Resources
→ Credentials
```

Create:

```text
Name:
Workshop SSH

Credential Type:
Machine
```

---

## Task 6 - Configure Authentication

Use the workshop account.

Example:

```text
Username:
student
```

Provide either:

- Password authentication

or

- SSH private key

depending on your lab setup.

Save the credential.

---

## Task 7 - Validate Connectivity

Review the Inventory and Credential.

Confirm the following:

```text
Inventory exists

Hosts exist

Groups exist

Credential exists
```

---

## Task 8 - Prepare for Job Execution

Review how the following components will connect together:

```text
Inventory

Credential

Project

Job Template
```

The remaining components will be created in the next exercise.

---

## Validation

You should have:

Inventory:

```text
Workshop Inventory
```

Groups:

```text
web
database
```

Hosts:

```text
node1
node2
```

Credential:

```text
Workshop SSH
```

---

## Bonus Challenge

Add variables at the group level.

Example:

```yaml
web_port: 80
```

for:

```text
web
```

and

```yaml
database_port: 5432
```

for:

```text
database
```

Review where the variables appear inside the AWX interface.