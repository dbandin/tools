# tmux-sessions scripts

## Ansible LAB

* Script: [tmux_virtual_sessions.sh](tmux_virtual_sessions.sh)

The lab I have set up is running virtualized with a NAT network to be isolated and be able of running it against a wifi interface without ip issues. To access the lab virtual machines from the host, the ssh port is forwarded. To allow this, just once the port forwardings are configured the port should be specified in the inventory file and the ips should be completed with the localhost address.

The script opens the hosts in the inventory into tiled panes of a tmux session.

### Inventory format

Each host is added in a new line, the name is just descriptive for tmux session name followed by the port, target host user login name and lastly the host ip or resolvable hostname. The format is a four column table separated be spaces. The first line is reserved for the ansible controller.

```
host_name1 port user1 ip
host_nam2  port user2 ip
```

* Example: [ansible_nat_lab_inventory](ansible_nat_lab_inventory)

### Usage

Execute the script [tmux_virtual_sessions.sh](tmux_virtual_sessions.sh) with the name of the inventory file as argument.

```bash
$ ./tmux_virtual_sessions.sh ansible_nat_lab_inventory
```

