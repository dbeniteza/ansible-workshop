# Solution - Exercise 11

## Concepts Covered

- Surveys
- Survey Variables
- Teams
- Users
- RBAC
- Self-Service Automation

---

## Why Surveys?

Surveys allow users to provide input dynamically without changing playbooks.

Example:

Question:

```text
Username
```

Response:

```text
developer01
```

AWX automatically provides:

```yaml
survey_username: developer01
```

to the playbook.

---

## Example Survey Variable

Survey configuration:

```text
Question:
Username

Variable:
survey_username
```

Playbook usage:

```yaml
- name: Create user

  ansible.builtin.user:

    name: "{{ survey_username }}"
    state: present
```

---

## Team

Created:

```text
Workshop Operators
```

Purpose:

- Group users
- Simplify permission assignments
- Delegate automation execution

---

## User

Created:

```text
student1
```

Added to:

```text
Workshop Operators
```

---

## RBAC Configuration

Granted:

```text
Execute
```

Permission on:

```text
Workshop Survey Demo
```

to:

```text
Workshop Operators
```

This allows:

```text
Launch job
View results
```

without granting administrative privileges.

---

## Example Permission Model

Administrators:

```text
Manage inventories
Manage credentials
Manage projects
Manage templates
```

Operators:

```text
Execute automation
View execution results
```

---

## Self-Service Automation

The final workflow becomes:

```text
User
 │
 ▼
Survey
 │
 ▼
Job Template
 │
 ▼
Execution
 │
 ▼
Managed Host
```

without requiring access to the underlying playbook.

---

## Verify User Creation

Example:

```bash
id labuser
```

Expected:

```text
uid=...
```

showing the account exists.

---

## Benefits of RBAC

- Security
- Delegation
- Governance
- Auditing
- Separation of Duties

---

## Key Takeaways

Surveys make automation flexible.

RBAC makes automation secure.

Together they enable safe self-service automation where users can execute approved automation without needing full administrative access to the Automation Controller.