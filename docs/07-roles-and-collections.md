# Roles and Collections

## Roles

Roles organize automation into reusable structures.

Example:

```text
roles/

└── apache
    ├── tasks
    ├── handlers
    ├── templates
    └── defaults
```

## Using a Role

```yaml
roles:

  - apache
```

## Collections

Collections package automation content.

Contents may include:

- Roles
- Modules
- Plugins
- Playbooks

## Ansible Galaxy

Install collections:

```bash
ansible-galaxy collection install community.general
```

List collections:

```bash
ansible-galaxy collection list
```

## Benefits

- Reuse
- Standardization
- Community sharing