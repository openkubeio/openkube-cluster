## export NFS_SERVER variable. This is your NFS server.
## ansible 127.0.0.1 -m shell -a 'echo "{{ hostvars.nfs.ip }}"'
export NFS_SERVER=192.172.100.100


# apply the yamls to setup the provisioner and the storage class
kubectl apply -f nfs-rbac.yaml
kubectl apply -f nfs-storage-class.yaml
envsubst < nfs-provisioner.yaml | kubectl apply -f -

# test create a nfs pvc
kubectl apply -f nfs-pvc-test.yaml