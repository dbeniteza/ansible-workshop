# Ansible Inventories

## What is an Inventory?

An inventory defines the systems managed by Ansible.

Example:

```ini
[web]
web01
web02

[database]
db01
```

## Groups

Hosts can be grouped logically.

```ini
[web]
web01
web02
```

## Variables

Variables may be assigned to hosts or groups.

```ini
[web:vars]
http_port=80
```

## Common Variables

```ini
ansible_user=student
ansible_host=10.0.0.10
ansible_port=22
```

## Best Practices

- Group similar systems
- Use group_vars
- Avoid duplication
- Prefer DNS names over IPs
