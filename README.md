### provision all virtual machines
```
provision-machines.sh
```

### ansible check all virtual machines		
```
export ANSIBLE_CONFIG=$(pwd)/ansible.cfg
ansible master -m ping 
```

### ansible bootstrap clutster 
```
ansible-playbook bootstrap.yaml
```