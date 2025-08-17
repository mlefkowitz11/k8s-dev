# k8s-ha (Ansible)

## Quick start
1) Edit `inventory.yml` and `group_vars/all.yml` to match your IPs, NIC, and VIP.
2) Run: `./DEPLOY-NOW.sh`

## Notes
- Uses kubeadm v1beta3 config.
- pkgs.k8s.io repo branch is derived dynamically from `kubernetes_version` (e.g., 1.30.x -> v1.30).
- Handlers are in proper `handlers/main.yml` (no inline `listen:` in tasks).
- Idempotent firewall tasks only run if firewalld/ufw are installed **and active**.