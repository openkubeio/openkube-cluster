### vagrant provision all virtual machines

```
provision-machines.sh
```

### ansible check all virtual machines		

```
ansible master -i inventories -m shell -a "date"

export ANSIBLE_CONFIG=$(pwd)/ansible.cfg

ansible master -m shell -a "hostname -A"
```

### ansible install docker

```
ansible-playbook docker.yaml
```
### ansible install kublet
```
ansible-playbook prepare.yaml
ansible-playbook kubeadm.yaml
```
### ansible ha cluster
```
ansible-playbook haproxy.yaml
ansible-playbook bootstrap.yaml
```
