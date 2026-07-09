# Solution - Exercise 05

## Concepts Covered

- Roles
- Defaults
- Tasks
- Handlers
- Templates
- Collections
- Ansible Galaxy

---

## Create a Role

```bash
ansible-galaxy role init apache
```

Generated structure:

```text
apache/
├── defaults/
├── files/
├── handlers/
├── meta/
├── tasks/
├── templates/
└── vars/
```

---

## Install Collection

```bash
ansible-galaxy collection install community.general
```

List installed collections:

```bash
ansible-galaxy collection list
```

---

## Execute

```bash
ansible-playbook \
  -i inventory/inventory.ini \
  solutions/05-roles-and-collections/deploy-webserver.yml
```

---

## Expected Result

Apache should be:

- Installed
- Running
- Enabled on boot

The generated page should display:

```text
Ansible Workshop

Host: node1

Date: YYYY-MM-DD
```

---

## Key Takeaways

Roles are the preferred way to organize reusable automation.

Collections are the preferred way to distribute automation content.

Together they form the foundation of large-scale Ansible projects.