# Demo-app

This role sets up a tiny python flask application that's absolutely terrible to
fetch a table from postgres and render the table as a web page. Inefficient, but
it works.

## Defaults

```
---
nginx:
  server_name: "test.foo.bar"

python:
  root: "/var/lib/demo"
  host: "127.0.0.1"
  port: 8080
  db:
    host: "127.0.0.1"
    port: 5432
    username: "hello"
    password: "world"
    database: "foo"
    table: "bar"
```
