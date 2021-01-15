### vagrant provision all virtual machines

```
provision-machines.sh
```

### ansible check all virtual machines		
```
ansible master -i inventories -m shell -a "date"
export ANSIBLE_CONFIG=$(pwd)/ansible.cfg
ansible master -m shell -a "hostname -A"
ansible master -m debug -a "msg='{{ hostvars }}'"
ansible master -m debug -a "msg='{{ hostvars.master2.ansible_ssh_host }}'"
ansible master -m debug -a "msg='{{ groups.master }}'"
```

```
cd playbooks/roles/
ansible-galaxy init test
ansible-playbook test.yaml
```



### ansible install 

```
ansible-playbook setup.yaml
```