# Exercise 03 - Conditionals, Handlers and Loops

## Objective

Learn how to:

- Iterate over collections using loops
- Execute tasks conditionally
- Capture task results
- Trigger handlers when changes occur

---

## Background

Real automation often needs to:

- Create multiple resources
- React to system state
- Restart services only when necessary

Ansible provides:

- Loops
- Conditionals
- Registered variables
- Handlers

to support these scenarios.

---

## Tasks

### Task 1 - Create Users with a Loop

Create a playbook:

```text
playbooks/exercise-03/users-and-httpd.yml
```

Create the following users:

```text
developer
tester
operator
```

Requirements:

- Use a single task
- Use a loop
- Avoid creating one task per user

---

### Task 2 - Install Apache

Install Apache on hosts in the `web` group.

Requirements:

- Use a package module
- Register the result

Example:

```yaml
register: package_result
```

---

### Task 3 - Use a Conditional

Display a message only if the Apache package was changed.

Requirements:

- Use a conditional
- Use the registered variable from the previous task

Expected message:

```text
Apache was installed or updated.
```

---

### Task 4 - Configure a Handler

Create a handler named:

```text
restart_httpd
```

The handler must:

- Restart Apache
- Execute only when notified

---

### Task 5 - Trigger the Handler

Deploy or update:

```text
/var/www/html/index.html
```

Requirements:

- Notify the handler
- The handler should run only if the file changes

---

## Validation

Execute:

```bash
ansible-playbook \
  -i inventory/inventory.ini \
  playbooks/exercise-03/users-and-httpd.yml
```

Verify:

- All users are created
- Apache is installed
- Index page exists
- Handler executes only when changes occur

---

## Bonus Challenge

Display different messages depending on the operating system.

Example:

```yaml
when: ansible_distribution == "Rocky"
```

Possible output:

```text
Rocky Linux detected.
```