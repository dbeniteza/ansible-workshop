# Solution - Exercise 03

## Concepts Covered

- Loops
- Conditionals
- Registered Variables
- Handlers

---

## Loop Example

```yaml
loop:
  - developer
  - tester
  - operator
```

A single task manages multiple users.

---

## Registered Variable Example

```yaml
register: package_result
```

The output of the task becomes available for later tasks.

---

## Conditional Example

```yaml
when: package_result.changed
```

The task is executed only if the package installation changed the host state.

---

## Handler Example

```yaml
notify: restart_httpd
```

The handler executes only when notified.

---

## Execute

```bash
ansible-playbook \
  -i inventory/inventory.ini \
  solutions/03-conditionals-handlers-loops/users-and-httpd.yml
```

---

## Expected Results

Users created:

```text
developer
tester
operator
```

Apache installed on:

```text
web
```

Index page deployed:

```text
/var/www/html/index.html
```

Handler behavior:

```text
First execution:
  changed=1
  restart_httpd executed

Subsequent executions:
  changed=0
  restart_httpd not executed
```

This demonstrates one of the most important Ansible principles:

**only perform actions when a change actually occurs.**
`