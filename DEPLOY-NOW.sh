#!/usr/bin/env bash
set -euo pipefail

# Logging
mkdir -p logs
ts="$(date +'%Y%m%d-%H%M%S')"
LOGFILE="logs/k8s-ansible-deployment-${ts}.log"
echo "Logging to ${LOGFILE}"

# Force this repo’s config and clear any callback overrides
export ANSIBLE_CONFIG="$(cd "$(dirname "$0")" && pwd)/ansible.cfg"
unset ANSIBLE_STDOUT_CALLBACK
unset ANSIBLE_CALLBACK_PLUGINS
unset ANSIBLE_LOAD_CALLBACK_PLUGINS

# Run the playbook
ansible-playbook -i inventory.yml site.yml -u automation --private-key ~/.ssh/id_rsa --become | tee "${LOGFILE}"
