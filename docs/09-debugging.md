# Debugging and Troubleshooting

## Debug Module

Display information during execution.

```yaml
- debug:
    var: my_variable
```

## Custom Message

```yaml
- debug:
    msg: "Deployment complete"
```

## Verbosity

```bash
ansible-playbook site.yml -vvv
```

## Syntax Validation

```bash
ansible-playbook site.yml --syntax-check
```

## Common Problems

- Connectivity issues
- Missing variables
- Inventory errors
- Permission problems

## Troubleshooting Approach

1. Validate inventory
2. Validate syntax
3. Test connectivity
4. Increase verbosity