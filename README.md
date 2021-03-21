### Overview

Openkube cluster is implemented with with below design to give a flavor of on-prem cluster hosting. With this setup its real quick to spin up your own cluster for all sort of Developement and POCs.

**This cluster with below architecture can be provisioned with even only one master node as well and it takes minimal resoures. All you need to update the ansible hosts file in this repository with  your virtual machine IP addresses.** 


<img src="https://github.com/openkubeio/openkube-cluster/raw/master/docs/architecture.PNG" width="600">


**Capasity Nodes**
- nfs - node to run NFS server
- lbr - node to run HA Proxy

**Controller Node**
- node to run kubectl and helm cli. Used by admin to manage workload.

**Master Nodes**
- node group to run as control pane

**Worker Nodes**
- node group to run work loads 
    

    
### Check all virtual machines are rechable	
Once you are done updating the hosts file, you can check connectivity with the below commands
```
export ANSIBLE_CONFIG=$(pwd)/ansible.cfg
ansible all -m ping 
```

### Bootstraping the clutster 

Bootstrap the cluster as the design pattern followd in the hosts file while updating the configurations.
```
ansible-playbook ansible/playbooks/bootstrap.yaml
```

This playbok will set up the controller with kubectl node configurations. 
With this node you can control the cluster and manage its deploymnet.
```
ansible-playbook ansible/playbooks/kubectl.yaml
```
