# Ansible experiments

This repository collects some ansible experiments into seperate playbooks and
roles. Please see the rest of this README for more details on each part or take a
look at the README of each role to see how to use it.

## Playbooks

* `webapp.yaml`: This playbook sets up the basics of a web application with HA
  components all around. It spins up a HA pair of HAproxy load balancers. Through
  these load balancers the frontend and backend/db hosts are available. The
  frontends are accesable through `80` and `443`, while a read path is available
  at `5432` and a write path at `5433` for the DB.  
  At the moment this is the only playbook and it can easily be spun up with
  ```
  ansible-playbook ./webapp.yaml -i inventory
  ```
