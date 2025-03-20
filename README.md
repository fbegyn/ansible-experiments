# Ansible experiments

This repository collects some ansible experiments into seperate playbooks and
roles. Please see the rest of this README for more details on each part or take a
look at the README of each role to see how to use it.

## Playbooks

* `webapp.yaml`: This playbook sets up the basics of a web application with HA
  components all around. It spins up a HA pair of NGINX web servers. Through
  these web servers, a small python flask web app is exposed. The web servers are
  HA through a VIP that's available on all hosts where `nginx` is running. The DB
  is available for reading on all nodes, but writing should only happen through
  the VIP that follows the Patroni leader.  
  At the moment this is the only playbook and it can easily be spun up with
  ```
  ansible-playbook ./webapp.yaml -i inventory
  ```
