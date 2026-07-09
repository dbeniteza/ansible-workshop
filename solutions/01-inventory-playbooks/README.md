# Solution - Exercise 01

## Inventory

```ini
[linux]

node1
node2

[linux:vars]

ansible_user=student
```

## Playbook

```yaml
---
- name: Workshop validation

  hosts: all

  gather_facts: false

  tasks:

    - name: Ping hosts

      ansible.builtin.ping:
```

## Execute

```bash
ansible-playbook \
  -i inventory/workshop.ini \
  playbooks/workshop-ping.yml
```

## Expected Result

```text
PLAY RECAP

node1 : ok=1 failed=0
node2 : ok=1 failed=0
```