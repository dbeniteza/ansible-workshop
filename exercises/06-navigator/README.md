# Exercise 06 - Ansible Navigator and Execution Environments

## Objective

Learn how to:

- Run playbooks using Ansible Navigator
- Understand Execution Environments
- Inspect available collections
- Work with containerized automation runtimes

---

## Background

Traditionally, Ansible runs directly from the operating system where Ansible is installed.

This approach often creates problems:

- Different package versions
- Missing Python modules
- Different collection versions
- Environment inconsistencies

Execution Environments solve these problems using containers.

Ansible Navigator provides a modern interface for using Execution Environments.

---

## Task 1 - Verify Installation

Check Navigator availability:

```bash
ansible-navigator --version
```

Verify Ansible:

```bash
ansible --version
```

---

## Task 2 - Explore Available Images

List available Execution Environments:

```bash
ansible-navigator images
```

Review:

- Image name
- Ansible version
- Collections included

---

## Task 3 - Inspect Collections

Review installed collections:

```bash
ansible-navigator collections
```

Locate:

```text
community.general
```

installed during the previous exercise.

---

## Task 4 - Run a Playbook

Execute the connectivity playbook:

```bash
ansible-navigator run \
  playbooks/ping.yml \
  -i inventory/inventory.ini
```

Review the output inside the Navigator interface.

---

## Task 5 - Run Using Standard Output Mode

Execute:

```bash
ansible-navigator run \
  playbooks/ping.yml \
  -i inventory/inventory.ini \
  -m stdout
```

Compare the output with the normal Ansible command.

---

## Task 6 - Create a Navigator Configuration

Create:

```text
ansible-navigator.yml
```

Requirements:

- Configure stdout mode
- Configure inventory path
- Configure execution environment

---

## Validation

Execute:

```bash
ansible-navigator run playbooks/ping.yml
```

using your Navigator configuration.

Successful execution should show:

```text
failed=0
```

for all hosts.

---

## Bonus Challenge

Execute:

```bash
ansible-navigator doc ansible.builtin.template
```

Review:

- Parameters
- Examples
- Return values

This command provides module documentation directly from Navigator.