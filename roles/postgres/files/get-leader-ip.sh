#! /usr/bin/env bash

patronictl -c /etc/patroni/patroni.yml list -f json | jq '.[] | select(.Role | contains("Leader"))'
