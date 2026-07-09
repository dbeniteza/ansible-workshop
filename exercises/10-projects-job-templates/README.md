# Exercise 10 - Projects and Job Templates

## Objective

Learn how to:

- Create a Project
- Connect AWX to a Git repository
- Synchronize automation content
- Create a Job Template
- Launch automation from the AWX UI
- Review job output

---

## Background

AWX does not store playbooks directly.

Instead, automation content is typically stored in Git repositories.

AWX retrieves automation content by creating a Project.

Projects make automation:

- Version controlled
- Auditable
- Shareable
- Reusable

---

## Architecture

```text
Git Repository
      |
      v
   Project
      |
      v
  Playbooks
      |
      v
 Job Template
      |
      v
 Execution
```

---

## Task 1 - Create a Project

Navigate to:

```text
Resources
→ Projects
```

Create:

```text
Name:
Ansible Workshop

Organization:
Default
```

Source Control Type:

```text
Git
```

Provide the URL of your workshop repository.

Example:

```text
https://github.com/<your-user>/ansible-workshop.git
```

---

## Task 2 - Synchronize the Project

Click:

```text
Sync
```

Verify:

```text
Successful
```

Review the sync output.

Confirm that AWX can see the repository contents.

---

## Task 3 - Review Available Playbooks

After synchronization, verify that AWX can discover:

```text
playbooks/ping.yml

playbooks/apache.yml

playbooks/facts.yml

playbooks/users.yml
```

---

## Task 4 - Create a Job Template

Navigate to:

```text
Resources
→ Templates
```

Select:

```text
Add
→ Job Template
```

Create:

```text
Name:
Workshop Ping

Job Type:
Run
```

---

## Task 5 - Configure the Template

Project:

```text
Ansible Workshop
```

Inventory:

```text
Workshop Inventory
```

Credential:

```text
Workshop SSH
```

Playbook:

```text
playbooks/ping.yml
```

Save the template.

---

## Task 6 - Launch the Job

Launch:

```text
Workshop Ping
```

Observe:

- Job Status
- Play Output
- Task Results
- Host Summary

---

## Task 7 - Review Job Details

Review:

```text
Start Time

Duration

Tasks

Host Results
```

Locate the PLAY RECAP section.

---

## Task 8 - Create a Second Template

Create:

```text
Workshop Facts
```

Use:

```text
playbooks/facts.yml
```

Launch the job.

Review the output.

---

## Validation

You should have:

```text
Project:
Ansible Workshop
```

```text
Job Template:
Workshop Ping
```

```text
Job Template:
Workshop Facts
```

Both jobs should complete successfully.

---

## Bonus Challenge

Create a third Job Template:

```text
Workshop Users
```

Use:

```text
playbooks/users.yml
```

Execute the job and verify that users are created on all hosts.