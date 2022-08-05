# clarkezoneinfra
All the infra

This is where I'm going to be migrating infrastructure deployment code for my devboxes, cloud environments etc.  Work in progress

How to apply to a remote machine (assumes you have an account with user james)

1. Install ansible
2. First create an inventory file in inventory

```ini
[devbox]
10.12.12.76   host_name=dev1
10.31.157.107   host_name=dev2
10.59.14.24   host_name=dev3
```

3. Run playbook
`ansible-playbook -i inventory/devbox.ini -u james devbox.yml -K`

