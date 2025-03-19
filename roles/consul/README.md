# Consul

This role is responsible for spinning up consul server and agents. It uses a set
of variables to determine if the node runds as agent or server mode.

## Defaults

```
consul:
  port: 8500
  host: "127.0.0.1"
  datacenter: "foo"
  data_dir: "/opt/consul"
  ui:
    enabled: "true"
  server: false
  client_addr: "127.0.0.1"
  bind_addr: "127.0.0.1"
  retry_join: ["127.0.0.1"]
  debug: false
  bootstrap_expect: 1
  log_level: "INFO"
```
