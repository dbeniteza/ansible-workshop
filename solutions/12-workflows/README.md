# Solution - Exercise 12

## Concepts Covered

- Workflow Templates
- Success Paths
- Failure Paths
- Approvals
- Automation Orchestration

---

## What Is a Workflow?

A Workflow Template allows multiple Job Templates to execute as a single automation process.

Instead of launching:

```text
Job A

Job B

Job C
```

manually, AWX orchestrates the process automatically.

---

## Workflow Structure

Implemented workflow:

```text
Workshop Ping
      |
      v
Workshop Facts
      |
      v
Workshop Users
```

Execution order:

1. Connectivity Validation
2. Fact Collection
3. User Management

---

## Success Paths

Success paths determine what executes next.

Example:

```text
Ping
  |
 Success
  |
 Facts
```

The Facts job executes only if Ping succeeds.

---

## Failure Paths

Example:

```text
Ping
  |
 Failure
  |
 Notification
```

Failure branches allow:

- Error handling
- Rollback processes
- Notifications
- Escalation procedures

---

## Approval Nodes

Approval nodes introduce governance.

Example:

```text
Facts
  |
Approval
  |
Deploy
```

An authorized user must approve execution before the workflow continues.

Typical enterprise use cases:

- Production deployments
- Security changes
- Firewall changes
- Database modifications

---

## Example Enterprise Workflow

```text
Validation
      |
      v
Create Backup
      |
      v
Approval
      |
      v
Deploy Change
      |
      v
Health Check
```

---

## Parallel Execution

Workflows support parallel automation.

Example:

```text
               +--> Update Web Servers
Validation ----|
               +--> Update Databases
```

This reduces execution time significantly.

---

## Benefits

Workflows provide:

- Automation orchestration
- Governance
- Reusability
- Error handling
- Visibility
- Standardization

---

## Final Architecture

```text
Inventory
      |
Credential
      |
Project
      |
Job Templates
      |
Workflow Template
      |
Execution Environment
      |
Managed Hosts
```

---

## Workshop Summary

Congratulations.

You have now worked with:

✓ Inventories

✓ Playbooks

✓ Variables

✓ Facts

✓ Conditionals

✓ Loops

✓ Handlers

✓ Templates

✓ Roles

✓ Collections

✓ Ansible Navigator

✓ Execution Environments

✓ Debugging

✓ AWX / Automation Controller

✓ Credentials

✓ Projects

✓ Job Templates

✓ Surveys

✓ RBAC

✓ Workflows

You are now capable of building, executing, and governing Ansible automation from both the command line and a centralized automation platform.