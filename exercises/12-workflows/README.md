# Exercise 12 - Workflows

## Objective

Learn how to:

- Create Workflow Templates
- Chain multiple Job Templates together
- Execute jobs in sequence
- Execute different actions based on success or failure
- Understand automation orchestration

---

## Background

Most enterprise automations require multiple steps.

Example:

```text
Validate Systems
      |
      v
Create Users
      |
      v
Deploy Application
      |
      v
Run Validation
```

Managing these manually becomes difficult.

Workflow Templates allow AWX to orchestrate complex automation sequences.

---

## Architecture

```text
Workflow

Ping Validation
      |
      v
Gather Facts
      |
      v
Create Users
      |
      v
Success
```

Each step executes only if the previous step succeeds.

---

## Task 1 - Verify Existing Job Templates

Confirm the following Job Templates exist:

```text
Workshop Ping

Workshop Facts

Workshop Users
```

If necessary, create any missing templates.

---

## Task 2 - Create a Workflow Template

Navigate to:

```text
Resources
→ Templates
→ Add
→ Workflow Template
```

Create:

```text
Name:
Workshop Workflow
```

Organization:

```text
Default
```

Save.

---

## Task 3 - Add the First Node

Add:

```text
Workshop Ping
```

This will validate connectivity.

---

## Task 4 - Add a Success Node

Connect:

```text
Workshop Facts
```

as a Success node.

Workflow:

```text
Workshop Ping
      |
      └── Success
              |
              v
       Workshop Facts
```

---

## Task 5 - Add Another Success Node

Connect:

```text
Workshop Users
```

to:

```text
Workshop Facts
```

Workflow:

```text
Workshop Ping
      |
      v
Workshop Facts
      |
      v
Workshop Users
```

---

## Task 6 - Visual Review

Verify the workflow graph.

Expected:

```text
Ping
  |
Facts
  |
Users
```

---

## Task 7 - Execute the Workflow

Launch:

```text
Workshop Workflow
```

Observe:

- Workflow execution
- Node execution order
- Status changes

---

## Task 8 - Review Workflow Output

Review:

```text
Workflow Status

Node Status

Execution Time

Results
```

Confirm all nodes completed successfully.

---

## Task 9 - Simulate Failure Handling

Create a temporary Job Template:

```text
Broken Job
```

Use a playbook containing an intentional failure.

Example:

```yaml
- fail:
    msg: "Intentional failure"
```

Add it to the workflow.

Review:

- Failure status
- Workflow behavior
- Node execution

---

## Task 10 - Add Approval Node

Modify the workflow.

Insert:

```text
Approval
```

between:

```text
Workshop Facts

Workshop Users
```

Result:

```text
Workshop Ping
      |
      v
Workshop Facts
      |
      v
 Approval
      |
      v
Workshop Users
```

Launch the workflow.

Approve execution.

Verify the remaining steps continue.

---

## Validation

Successful workflow:

```text
Workshop Ping

Workshop Facts

Workshop Users
```

All nodes:

```text
Successful
```

Approval node:

```text
Approved
```

---

## Bonus Challenge

Create two parallel branches.

Example:

```text
                +--> Create Users
Ping --> Facts -|
                +--> Apache Deployment
```

Verify both jobs execute simultaneously.