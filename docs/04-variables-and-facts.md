# Variables and Facts

## Variables

Variables allow automation to be reused.

Example:

```yaml
vars:
  package_name: httpd
```

Usage:

```yaml
name: "{{ package_name }}"
```

## Facts

Facts are collected from managed hosts.

Examples:

```yaml
ansible_hostname
ansible_distribution
ansible_memory_mb
```

## Display Facts

```yaml
- debug:
    var: ansible_facts
```

## Custom Facts

```yaml
- set_fact:
    server_role: web
```

## Best Practices

- Use meaningful names
- Avoid hardcoded values
- Centralize shared variables