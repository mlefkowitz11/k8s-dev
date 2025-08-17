Networking role (Debian 12 safe)
--------------------------------
* Only manages the control-plane (cp_iface) and storage (storage_iface) interfaces.
* Leaves the management NIC alone (manage_mgmt_nic=false by default).
* Applies IPs live using `ip address add` if missing and persists configuration under
  /etc/network/interfaces.d/<iface>.cfg.
* Reloads networking via handler with safe fallbacks:
    - ifreload (if present)
    - ifdown/ifup (if present)
    - ip link down/up as last resort
* Required inventory/group_vars structure per host:
    networking_host_map:
      <hostname>:
        cp: { ip: 10.4.20.X, cidr: 24 }
        storage: { ip: 10.11.9.X, cidr: 24 }
