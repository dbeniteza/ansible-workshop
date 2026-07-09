# Exercise 07 - Debugging and Troubleshooting

## Objective

Learn how to:

- Use the debug module
- Investigate variables
- Validate playbook syntax
- Analyze task failures
- Troubleshoot connectivity issues

---

## Background

Writing automation is only part of the job.

A significant amount of time is spent:

- Diagnosing failures
- Understanding task results
- Reviewing variables
- Troubleshooting environments

Ansible provides multiple tools to assist with debugging.

---

## Task 1 - Create a Debug Playbook

Create:

```text
playbooks/exercise-07/debug-playbook.yml
```

Execute against all hosts.

Enable fact gathering.

---

## Task 2 - Display Variables

Create the variables:

```yaml
application_name: workshop-app

environment: lab
```

Display the values using:

```yaml
ansible.builtin.debug
```

---

## Task 3 - Display Facts

Display:

```yaml
ansible_hostname

ansible_distribution

ansible_distribution_version
```

Use the debug module.

---

## Task 4 - Register a Variable

Run a command:

```yaml
hostname
```

Store the output using:

```yaml
register:
```

Display the result.

---

## Task 5 - Validate Syntax

Run:

```bash
ansible-playbook \
  playbooks/exercise-07/debug-playbook.yml \
  --syntax-check
```

Verify:

```text
playbook: debug-playbook.yml
```

is returned.

---

## Task 6 - Increase Verbosity

Execute:

```bash
ansible-playbook \
  playbooks/exercise-07/debug-playbook.yml \
  -vvv
```

Review:

- Variables
- Connections
- SSH information
- Task execution details

---

## Task 7 - Troubleshoot a Failure

Modify the playbook temporarily.

Change:

```yaml
application_name
```

to:

```yaml
application_nam
```

Execute the playbook.

Observe the failure.

Restore the correct variable name.

---

## Task 8 - Test Connectivity

Verify communication:

```bash
ansible all -m ping
```

Expected result:

```text
SUCCESS
```

for all hosts.

---

## Validation

Successful execution should display:

- Variables
- Facts
- Registered command output

No failed tasks should remain.

---

## Bonus Challenge

Display all collected facts:

```yaml
- debug:
    var: ansible_facts
```

Review the available information and identify:

- CPU count
- Memory
- Network interfaces