# Conditionals, Loops and Handlers

## Conditionals

Execute tasks only when conditions are met.

Example:

```yaml
when: ansible_distribution == "RedHat"
```

## Loops

Avoid repetitive tasks.

```yaml
loop:
  - user1
  - user2
  - user3
```

## Registered Variables

Store task output.

```yaml
register: package_result
```

## Handlers

Handlers run when notified.

```yaml
notify: restart_httpd
```

Handler example:

```yaml
handlers:

  - name: restart_httpd

    service:
      name: httpd
      state: restarted
```

## Use Cases

- Service restarts
- Reload configurations
- Trigger post-deployment actions
``