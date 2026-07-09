# Local Workshop Lab Environment

This environment provides a complete Ansible workshop playground running locally with Podman.

## Components

| Component | Purpose |
|------------|------------|
| Controller | Runs Ansible |
| Node1 | Managed Linux Host |
| Node2 | Managed Linux Host |

All systems run locally as containers.

## Architecture

```text
Controller
├── Node1
└── Node2
```

## Start the Environment

```bash
podman-compose up -d
```

Verify:

```bash
podman ps
```

Expected containers:

```text
ansible-controller
node1
node2
```

## Access the Controller

```bash
podman exec -it ansible-controller bash
```

## Validate Connectivity

```bash
ansible all -m ping
```

Expected result:

```text
SUCCESS
```

## Run First Playbook

```bash
ansible-playbook playbooks/ping.yml
```

## Inventory Location

```text
inventory.ini
```

## Configuration File

```text
ansible.cfg
```

## Stop the Environment

```bash
podman-compose down
```

## Rebuild Everything

```bash
podman-compose down

podman-compose build --no-cache

podman-compose up -d
```