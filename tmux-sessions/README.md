# tmux-sessions scripts

## Ansible LAB

* Script: [tmux_virtual_nat_sessions.sh](tmux_virtual_nat_sessions.sh)

The lab I have set up is running virtualized with a NAT network to be isolated and be able of running it against a wifi interface without ip issues. To access the lab virtual machines from the host, the ssh port is forwarded.

The script opens the hosts in the inventory into tiled panes of a tmux session.

### Inventory format

Each host is added in a new line, the name is just descriptive for tmux session name followed by the port and target host user login name. The format is a three column table separated be spaces. The first line is the ansible controller.

```
host_name1 port user1
host_nam2  port user2
```

* Example: [ansible_vbox_nat_lab_inventory](ansible_vbox_nat_lab_inventory)

### Usage

Execute the script [tmux_virtual_nat_sessions.sh](tmux_virtual_nat_sessions.sh) with the name of the inventory file as argument.

```bash
$ ./tmux_virtual_nat_sessions.sh ansible_vbox_nat_lab_inventory
```

