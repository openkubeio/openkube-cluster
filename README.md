### provision all virtual machines with vagrant
```
provision-machines.sh
```

### ansible check all virtual machines are rechable	
```
export ANSIBLE_CONFIG=$(pwd)/ansible.cfg
ansible all -m ping 
```

### ansible bootstrap clutster 
```
ansible-playbook ansible/playbooks/bootstrap.yaml
```