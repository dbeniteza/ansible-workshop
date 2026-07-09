# Solution - Exercise 06

## Concepts Covered

- Ansible Navigator
- Execution Environments
- Collections
- Containerized Automation

---

## Why Use Navigator?

Navigator provides:

- Consistent execution
- Collection browsing
- Documentation lookup
- Execution Environment management

Instead of:

```bash
ansible-playbook site.yml
```

you can use:

```bash
ansible-navigator run site.yml
```

---

## Execution Environments

An Execution Environment is a container image containing:

- Ansible Core
- Python dependencies
- Collections
- Supporting tools

Benefits:

- Portability
- Reproducibility
- Consistency

---

## View Collections

```bash
ansible-navigator collections
```

---

## View Documentation

```bash
ansible-navigator doc ansible.builtin.template
```

---

## View Images

```bash
ansible-navigator images
```

---

## Execute a Playbook

Interactive mode:

```bash
ansible-navigator run \
  playbooks/ping.yml \
  -i inventory/inventory.ini
```

---

## Execute in Standard Output Mode

```bash
ansible-navigator run \
  playbooks/ping.yml \
  -i inventory/inventory.ini \
  -m stdout
```

---

## Configuration File

Example:

```yaml
---
ansible-navigator:

  mode: stdout

  execution-environment:

    enabled: true

    image: quay.io/ansible/creator-ee:latest
```

Using a configuration file reduces command complexity and standardizes execution across teams.

---

## Expected Result

```text
PLAY RECAP

node1 : ok=1 failed=0
node2 : ok=1 failed=0
```

---

## Key Takeaways

Execution Environments provide a repeatable runtime for automation.

Navigator simplifies:

- Running playbooks
- Viewing documentation
- Managing collections
- Inspecting execution environments

These tools are now considered best practice for developing and operating modern Ansible automation.