# Solution - Exercise 02

## Concepts Covered

- Variables
- Facts
- Debug Module
- set_fact

## Execute

```bash
ansible-playbook \
  -i inventory/inventory.ini \
  solutions/02-variables-facts/workshop-vars.yml
```

## Expected Output

Examples:

```text
Team: Platform Engineering

Environment: Workshop

Hostname: node1

Distribution: Rocky

Version: 9.x

Role: student-lab
```

## Key Takeaways

Variables:

```yaml
vars:
  team_name: Platform Engineering
```

Facts:

```yaml
ansible_hostname
ansible_distribution
ansible_distribution_version
```

Custom Facts:

```yaml
ansible.builtin.set_fact
```

Facts allow automation to adapt dynamically to the target host while variables improve reusability and maintainability.
``