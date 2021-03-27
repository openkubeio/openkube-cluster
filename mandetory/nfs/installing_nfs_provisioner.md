###  Export NFS_SERVER 

Exoprt nfs server address. Replace the below with ansible outcome of the nfs server. 
ansible nfs -m shell -a 'echo "{{ hostvars.nfs.ip }}"'

```
export NFS_SERVER=192.172.100.100
```

### Apply the yamls to setup the provisioner and the storage class

```
kubectl apply -f nfs-rbac.yaml
kubectl apply -f nfs-storage-class.yaml
envsubst < nfs-provisioner.yaml | kubectl apply -f -
```

### Quick test a nfs pvc

```
kubectl apply -f nfs-pvc-test.yaml
kubectl get pvc
```