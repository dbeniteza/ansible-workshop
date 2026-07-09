# Exercise 01 - Inventories and Playbooks

## Objective

Create your first inventory and playbook.

---

## Background

Ansible requires two basic components:

1. An inventory
2. A playbook

The inventory identifies managed systems.

The playbook defines the automation tasks.

---

## Tasks

### Task 1

Create a file:

```text
inventory/workshop.ini
```

Requirements:

- Create a group named `linux`
- Add both lab hosts
- Configure the SSH user

Expected structure:

```ini
[linux]

...

[linux:vars]

...
```

---

### Task 2

Create a playbook:

```text
playbooks/workshop-ping.yml
```

Requirements:

- Run against all hosts
- Use the ping module
- Disable fact gathering

---

### Task 3

Execute the playbook.

```bash
ansible-playbook \
  -i inventory/workshop.ini \
  playbooks/workshop-ping.yml
```

---

## Validation

Successful output should show:

```text
ok=1
failed=0
```

for every host.

---

## Bonus Challenge

Add the following groups:

```ini
[web]

[database]
```

Move one host into each group.