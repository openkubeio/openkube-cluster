echo "--- Checking vagrant plugin"
[ $(vagrant plugin list | grep vagrant-hostmanager | wc -l) != 1 ] && vagrant plugin install vagrant-hostmanager 
[ $(vagrant plugin list | grep vagrant-vbguest | wc -l) != 1 ] && vagrant plugin install vagrant-vbguest


echo "--- creating data directory " 
mkdir -p ../data/

echo "--- provisioning cluster"
vagrant up master.qa.kube.io

vagrant ssh master.qa.kube.io -- -t "sudo kubeadm token create --print-join-command > /data/$cluster/kubeadm_join_cmd.sh"

vagrant up

echo "--- copying config from cluster"
cp ../data/cluster-openkube/config ~/.kube/

echo "--- labeling the nodes"
kubectl label node worker.qa.kube.io node-role.kubernetes.io/worker=worker 
kubectl label node worker.qa.kube.io node-role.kubernetes.io/management=management  

echo "--- validating  the nodes"
kubectl get nodes
