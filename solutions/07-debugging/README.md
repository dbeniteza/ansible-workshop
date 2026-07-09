# Solution - Exercise 07

## Concepts Covered

- Debug Module
- Registered Variables
- Facts
- Syntax Validation
- Verbosity
- Troubleshooting

---

## Debug Module

Display variables:

```yaml
- debug:
    msg: "{{ application_name }}"
```

Display structured variables:

```yaml
- debug:
    var: hostname_result
```

---

## Registered Variables

Store task output:

```yaml
register: hostname_result
```

Access command output:

```yaml
hostname_result.stdout
```

---

## Syntax Validation

Before running a playbook:

```bash
ansible-playbook \
  debug-playbook.yml \
  --syntax-check
```

This validates YAML and playbook structure.

---

## Verbose Execution

Increase output detail:

```bash
ansible-playbook \
  debug-playbook.yml \
  -vvv
```

Additional details include:

- SSH operations
- Variable evaluation
- Task execution flow
- Module arguments

---

## Connectivity Testing

Validate communication:

```bash
ansible all -m ping
```

Expected output:

```text
SUCCESS
```

---

## Display Facts

Show all gathered facts:

```yaml
- debug:
    var: ansible_facts
```

Useful information includes:

- Hostname
- CPU count
- Memory
- Network interfaces
- Operating System
- Distribution Version

---

## Execute

```bash
ansible-playbook \
  -i inventory/inventory.ini \
  solutions/07-debugging/debug-playbook.yml
```

---

## Key Takeaways

When troubleshooting:

1. Validate syntax first
2. Test connectivity
3. Use the debug module
4. Inspect variables
5. Increase verbosity
6. Review registered variables

These techniques are essential when managing large automation environments and are used daily by Ansible administrators and platform engineers.