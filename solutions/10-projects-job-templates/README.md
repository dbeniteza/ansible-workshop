# Solution - Exercise 10

## Concepts Covered

- Projects
- Git Integration
- Job Templates
- Job Execution
- Job Output Analysis

---

## Project

Created:

```text
Ansible Workshop
```

Source:

```text
Git
```

Repository:

```text
https://github.com/<your-user>/ansible-workshop.git
```

Purpose:

- Store playbooks
- Store roles
- Store templates
- Version automation

---

## Why Use Git?

Benefits:

- Change tracking
- Rollback capability
- Collaboration
- Auditability

AWX pulls content from Git rather than storing automation locally.

---

## Job Template

A Job Template combines:

```text
Project
+
Inventory
+
Credential
+
Playbook
```

into an executable automation job.

Example:

```text
Name:
Workshop Ping

Project:
Ansible Workshop

Inventory:
Workshop Inventory

Credential:
Workshop SSH

Playbook:
playbooks/ping.yml
```

---

## Executing a Job

Launch:

```text
Workshop Ping
```

Expected result:

```text
successful
```

Review:

```text
PLAY

TASKS

PLAY RECAP
```

---

## Example Job Flow

```text
Git Repository
       |
       v
 Project
       |
       v
 Playbook
       |
       v
 Credential
       |
       v
 Inventory
       |
       v
 Job Template
       |
       v
 AWX Job
       |
       v
 Managed Hosts
```

---

## Job History

AWX records:

- Who executed the job
- Execution time
- Result
- Duration
- Play output

This provides auditing and traceability.

---

## Successful Deployment Example

```text
Workshop Ping

Status:
Successful

Hosts:
2

Failures:
0
```

---

## Preparing for Next Exercise

The following objects now exist:

```text
✓ Inventory

✓ Groups

✓ Hosts

✓ Credential

✓ Project

✓ Job Template
```

Next we will introduce:

```text
Surveys
```

to allow users to provide input dynamically at execution time.

---

## Key Takeaways

Projects allow AWX to consume automation from Git.

Job Templates are the primary execution mechanism in AWX.

Every automation job launched from AWX uses:

```text
Project
+
Inventory
+
Credential
+
Playbook
```

Working together to execute automation in a controlled and auditable manner.