# Exercise 05 - Roles and Collections

## Objective

Learn how to:

- Create an Ansible role
- Organize automation into reusable structures
- Use roles from a playbook
- Install collections using Ansible Galaxy

---

## Background

As automation grows, large playbooks become difficult to maintain.

Roles provide a reusable structure that separates:

- Tasks
- Variables
- Handlers
- Templates
- Files

Collections provide a mechanism to package and distribute:

- Roles
- Modules
- Plugins
- Playbooks

---

## Task 1 - Create a Role

Generate a role named:

```text
apache
```

Hint:

```bash
ansible-galaxy role init apache
```

---

## Task 2 - Add Automation Logic

Modify the role so that it:

- Installs Apache
- Starts the service
- Enables the service on boot

---

## Task 3 - Add a Template

Create a template:

```text
index.html.j2
```

The page should contain:

- Hostname
- Date
- Workshop name

Use variables and facts.

---

## Task 4 - Deploy the Template

Deploy:

```text
/var/www/html/index.html
```

using the template module.

---

## Task 5 - Create a Handler

Create a handler:

```text
restart_httpd
```

The handler should restart Apache when the template changes.

---

## Task 6 - Create a Playbook

Create:

```text
playbooks/exercise-05/deploy-webserver.yml
```

Use the role from the playbook.

---

## Task 7 - Install a Collection

Install:

```text
community.general
```

Verify installation:

```bash
ansible-galaxy collection list
```

---

## Validation

Execute:

```bash
ansible-playbook \
  -i inventory/inventory.ini \
  playbooks/exercise-05/deploy-webserver.yml
```

Verify:

- Apache installed
- Apache service running
- Web page deployed
- Handler triggered when required

---

## Bonus Challenge

Add a variable:

```yaml
workshop_name: Ansible Workshop
```

Use it in the generated web page.