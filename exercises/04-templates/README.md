# Exercise 04 - Templates

## Objective

Learn how to:

- Create Jinja2 templates
- Use variables inside templates
- Generate configuration files dynamically
- Deploy templates using Ansible

---

## Background

Templates allow configuration files to be generated dynamically.

Instead of hardcoding values:

```text
Listen 80
```

we can use variables:

```jinja2
Listen {{ apache_port }}
```

Ansible replaces the variable value during deployment.

This makes automation reusable and easier to maintain.

---

## Tasks

### Task 1 - Create a Template

Create:

```text
templates/workshop-httpd.conf.j2
```

The template must contain:

- Apache listening port
- Document root
- Server administrator

Use variables.

Example:

```jinja2
Listen {{ apache_port }}
```

---

### Task 2 - Create Variables

Define the following variables:

```yaml
apache_port: 8080

document_root: /var/www/workshop

server_admin: workshop@example.com
```

Use either:

```text
inventory/group_vars/all.yml
```

or directly inside the playbook.

---

### Task 3 - Deploy the Template

Create:

```text
playbooks/exercise-04/template-demo.yml
```

Requirements:

- Execute against the web group
- Deploy the template
- Store the resulting file in:

```text
/tmp/httpd.conf
```

---

### Task 4 - Validate Variable Rendering

Display the variable values using the debug module before deploying the template.

Expected output:

```text
Port: 8080

Root: /var/www/workshop

Admin: workshop@example.com
```

---

## Validation

Execute:

```bash
ansible-playbook \
  -i inventory/inventory.ini \
  playbooks/exercise-04/template-demo.yml
```

Verify:

```bash
cat /tmp/httpd.conf
```

The template should contain resolved values rather than Jinja expressions.

---

## Bonus Challenge

Add the hostname of each server to the generated file using:

```yaml
ansible_hostname
```

Example:

```text
Generated for: node1
```