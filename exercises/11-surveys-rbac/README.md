# Exercise 11 - Surveys and RBAC

## Objective

Learn how to:

- Create Surveys
- Pass survey values to playbooks
- Create Teams
- Create Users
- Assign Roles and Permissions
- Implement self-service automation

---

## Background

One of the major advantages of AWX is allowing users to execute automation without modifying playbooks.

A Survey allows AWX to ask questions before a job starts.

Example:

```text
What username should be created?

developer
```

The answer becomes an Ansible variable.

At the same time, RBAC ensures users only access the automation they are authorized to use.

---

## Architecture

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
Playbook
 │
 ▼
Managed Hosts
```

RBAC controls who can launch the Job Template.

---

## Task 1 - Create a Team

Navigate to:

```text
Access Management
→ Teams
```

Create:

```text
Workshop Operators
```

Organization:

```text
Default
```

Save.

---

## Task 2 - Create a User

Navigate to:

```text
Access Management
→ Users
```

Create:

```text
student1
```

Provide:

- Username
- Password
- Email

Save.

---

## Task 3 - Add User to Team

Add:

```text
student1
```

to:

```text
Workshop Operators
```

Verify membership.

---

## Task 4 - Create a New Job Template

Create:

```text
Workshop Survey Demo
```

Use:

```text
Project:
Ansible Workshop

Inventory:
Workshop Inventory

Credential:
Workshop SSH
```

Playbook:

```text
playbooks/users.yml
```

Save.

---

## Task 5 - Create a Survey

Open:

```text
Workshop Survey Demo
```

Enable:

```text
Survey
```

Create the following question:

```text
Question:
Username

Variable:
survey_username

Answer Type:
Text
```

Required:

```text
Yes
```

Save the survey.

---

## Task 6 - Modify Playbook Logic

Update the playbook so that it can use:

```yaml
survey_username
```

from AWX.

Example:

```yaml
name: "{{ survey_username }}"
```

Commit and push the changes to Git.

Update the AWX Project.

---

## Task 7 - Launch the Job

Execute:

```text
Workshop Survey Demo
```

Provide:

```text
labuser
```

when prompted.

Verify successful execution.

---

## Task 8 - Verify User Creation

Login to a managed host.

Verify:

```bash
id labuser
```

Expected:

```text
user exists
```

---

## Task 9 - Configure Permissions

Open:

```text
Workshop Survey Demo
```

Grant:

```text
Execute
```

permission to:

```text
Workshop Operators
```

---

## Task 10 - Test Delegation

Login as:

```text
student1
```

Verify:

```text
Can launch:
  Workshop Survey Demo

Cannot administer:
  Projects
  Credentials
  Inventories
```

---

## Validation

Confirm:

✓ User created

✓ Team created

✓ Survey configured

✓ Variable passed to playbook

✓ Job executed successfully

✓ Permissions assigned correctly

---

## Bonus Challenge

Create a second survey question:

```text
Question:
Environment

Variable:
environment
```

Possible values:

```text
development

test

production
```

Display the selected environment during playbook execution.