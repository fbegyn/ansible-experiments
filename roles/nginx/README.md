# Nginx

Installs and sets up a HA nginx setup. It will use keepalived to assign a VIP to
all frontend nodes when nginx is running on them.

## Defaults

```yaml
keepalived:
  virtual_router_id: 100
  interface: "eth0"
  advert_int: 4
  priority: 100
  auth_pass: "foo123bar"
```
