# Playbooks

## What is a Playbook?

A playbook describes automation using YAML.

Example:

```yaml
---
- name: Install Apache

  hosts: web

  become: true

  tasks:

    - name: Install package
      ansible.builtin.dnf:
        name: httpd
        state: present
```

## Anatomy of a Play

### Hosts

Target systems.

### Tasks

Actions executed.

### Modules

The implementation for each task.

## Idempotency

A playbook should produce the same result every time it is executed.

Good automation is idempotent.

## Running Playbooks

```bash
ansible-playbook website.yml
```
``