#! /usr/bin/env bash
set -euo pipefail

patronictl -c /etc/patroni/patroni.yml list -f json | jq '.[] | select(.Role | contains("Leader"))'
