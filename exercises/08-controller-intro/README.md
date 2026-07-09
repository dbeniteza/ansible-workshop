# Exercise 08 - Introduction to Automation Controller

## Objective

Learn how to:

- Access AWX
- Navigate the user interface
- Understand core automation objects
- Understand how automation is executed
- Explore the concepts behind centralized automation

---

## Background

Until now, all automation was executed from the command line.

Enterprise environments often require:

- Shared automation
- Role-based access control
- Auditing
- Scheduling
- Approval workflows
- Centralized credentials

Automation Controller (AWX) provides these capabilities.

---

## Architecture Overview

Automation execution requires multiple components.

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
 Inventory
       |
       v
Credential
       |
       v
 Job Template
       |
       v
 Execution
```

Understanding these relationships is essential before creating automation jobs.

---

## Task 1 - Access AWX

Retrieve the administrator password.

```bash
kubectl get secret awx-admin-password \
  -n awx \
  -o jsonpath="{.data.password}" | base64 -d
```

Retrieve service information.

```bash
kubectl get svc -n awx
```

Access AWX from your browser.

Login:

```text
Username: admin
Password: <retrieved password>
```

---

## Task 2 - Explore the Navigation Menu

Locate the following sections:

- Dashboard
- Organizations
- Users
- Teams
- Inventories
- Credentials
- Projects
- Job Templates
- Schedules

Do not create anything yet.

Simply review the available options.

---

## Task 3 - Review Existing Objects

Identify:

- Default organization
- Default users
- Existing execution environments

Document your findings.

---

## Task 4 - Explore Execution Environments

Navigate to:

```text
Administration
→ Execution Environments
```

Review:

- Name
- Image
- Pull policy

Understand how execution environments relate to Ansible Navigator and the local workshop exercises.

---

## Task 5 - Review Job History

Navigate to:

```text
Automation Execution
→ Jobs
```

Review available information:

- Status
- Duration
- Playbook
- Host summary

Even if no jobs have been executed yet, familiarize yourself with the interface.

---

## Task 6 - Identify the Required Objects

In your own words describe:

- Organization
- Inventory
- Credential
- Project
- Job Template

Use a text file or notes.

---

## Validation

You should be able to explain:

- How a playbook reaches a managed host
- What a Project is
- What an Inventory is
- What a Credential is
- What a Job Template is

without referring to the documentation.

---

## Bonus Challenge

Draw a simple diagram showing how AWX executes automation from Git to a managed host.

Example:

Git -> Project -> Inventory -> Credential -> Job Template -> Host
