# Postgresql/Patroni

Probably the most complex role in here since this contains a lot of state things
since ... well, it's a database. This spins up a Postgresql cluster through
[Patroni](https://patroni.readthedocs.io/en/latest/). Patroni adds some
complexity, but in turn you get fully managed clusters with goog CLI tooling to
trigger switchovers and failovers.

1. It first and adds the postgres RPM repository to the host
1. It disables the default shipped postgres from the main repo
1. Install the specified postgres version from `postgres.version`
1. Ensures that some base paths are present (logging and `PGDATA`)
1. Renders Patroni configuration according to the `postgres` and `patroni` config settings
1. Spins up Patroni and Postgresql on the `db-bootstrap` node
1. Run Patroni on all other nodes in the cluster
1. Sets up `keepalived` to track the cluster leader and assign the VIP to it and
   only it.

HA write functionality is achieved by assigning a VIP to the leader, since only
it is allowed write operations.

HA read is achieved naturally through clustering, each node of the cluster can be
used to read data from the cluster.

## Defaults

```yaml
keepalived:
  virtual_router_id: 100
  interface: "eth0"
  advert_int: 4
  priority: 100
  auth_pass: "foo123bar"

postgres:
  version: "17"
  listen_addresses: ["127.0.0.1"]
  port: 5432
  username: "postgres"
  password: "postgres"
  data_directory: "/var/lib/pgsql/17/data"
  home_directory: "/var/lib/pgsql"
  log:
    directory: "/var/log/postgres"
  replication_network: "127.0.0.0/8"
  trusted_network: "127.0.0.0/8"
  replication:
    application_name: "foobar"
    username: "hello"
    password: "world"
  password_encryption: "scram-sha-256"

patroni:
  cluster_name: "foobar"
  port: 8008
  log:
    level: "INFO"
    directory: "/var/log/patroni"
  watchdog:
    mode: "off"

consul:
  port: 8500
  host: "127.0.0.1"
  datacenter: "foo"
  data_dir: "/opt/consul"
  ui:
    enabled: "true"
  client_addr: "127.0.0.1"
  bind_addr: "127.0.0.1"
  retry_join: ["127.0.0.1"]
  log_level: "INFO"
```
