# tmux-sessions scripts

## Ansible LAB

The lab I have set up is running virtualized with a NAT network to be isolated and be able of running it against a wifi interface without ip issues. To access the lab virtual machines from the host, the ssh port is forwarded.

### Inventory format

Each host is added in a new line, the name is just descriptive for tmux session name followed by the port and target host user login name. The format is a three column table separated be spaces. The first line is the ansible controller.

```
host_name1 port user1
host_nam2  port user2
```
