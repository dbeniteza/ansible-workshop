# Exercise 02 - Variables and Facts

## Objective

Learn how to:

- Define variables
- Use variables in tasks
- Access Ansible facts
- Display information about managed hosts

---

## Background

Variables make playbooks reusable and configurable.

Facts are pieces of information gathered automatically from managed hosts.

Examples of facts include:

- Hostname
- Operating System
- IP Address
- CPU Information
- Memory Information

---

## Tasks

### Task 1

Create a playbook:

```text
playbooks/workshop-vars.yml
```

Requirements:

- Execute against all hosts
- Gather facts
- Define the following variables:

```yaml
team_name: Platform Engineering
environment: Workshop
```

---

### Task 2

Display a message using the variables.

Expected format:

```text
Team: Platform Engineering
Environment: Workshop
```

---

### Task 3

Display the following facts:

- Hostname
- Distribution
- Operating System Version

Use the Ansible debug module.

---

### Task 4

Create a custom fact using:

```yaml
ansible.builtin.set_fact
```

Create:

```yaml
server_role: student-lab
```

Display the value.

---

## Validation

Successful execution should display:

- Custom variables
- Hostname
- Operating System
- Custom fact

for every managed host.

---

## Bonus Challenge

Display a message using both variables and facts.

Example:

```text
node1 is running Rocky Linux and belongs to the Platform Engineering team.
```