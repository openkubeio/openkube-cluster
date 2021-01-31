### provision all virtual machines with vagrant
```
provision-machines.sh
```

### setup ssh key-gen 

#ssh-agent bash
#ssh-add /gitlab.pem


### ansible check all virtual machines are rechable	
```
export ANSIBLE_CONFIG=$(pwd)/ansible.cfg
ansible all -m ping 
```

### ansible bootstrap clutster 
```
ansible-playbook ansible/playbooks/bootstrap.yaml
```