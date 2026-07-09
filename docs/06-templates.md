# Templates

## What Are Templates?

Templates generate files dynamically.

Ansible uses Jinja2.

## Example

Template:

```jinja2
Listen {{ http_port }}
```

Playbook:

```yaml
- template:
    src: httpd.conf.j2
    dest: /etc/httpd/conf/httpd.conf
```

Generated:

```text
Listen 8080
```

## Common Uses

- Apache configuration
- NGINX configuration
- Application settings
- Dynamic inventories

## Benefits

- Reusable
- Dynamic
- Easy to maintain