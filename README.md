### provision all virtual machines
```
provision-machines.sh
```

### ansible check all virtual machines		
```
export ANSIBLE_CONFIG=$(pwd)/ansible.cfg
ansible all -m ping 
```

### ansible bootstrap clutster 
```
ansible-playbook ansible/playbooks/bootstrap.yaml
```