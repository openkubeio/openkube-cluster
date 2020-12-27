Login onto the node master1 

```
export HOST_NAME=$(hostname -A)

export IPADDR_ENP0S8=$(ifconfig enp0s8 | grep Mask | awk '{print $2}'| cut -f2 -d:)

kubeadm init --kubernetes-version v1.17.0 --apiserver-advertise-address=$IPADDR_ENP0S8 --node-name $HOST_NAME  --pod-network-cidr 10.10.0.0/16 --service-cidr  10.150.0.0/16  --control-plane-endpoint "proxy.openkube.io:6443" --upload-certs --v=7

```
-------------------------------------------------

Output of kubeadm init >

```
You can now join any number of the control-plane node running the following command on each as root:

  kubeadm join proxy.openkube.io:6443 --token x03ngl.qxq1onlbo3wqleyj \
    --discovery-token-ca-cert-hash sha256:feb13a1f54d2ce1408692932821f79945c96e05c56efde0aba4d2529c1f3dd84 \
    --control-plane --certificate-key c90c6fd821d7ba31cd46fe0ca934ddcb6e6ec49c1a55ccdecda92a8c5a946001

Please note that the certificate-key gives access to cluster sensitive data, keep it secret!
As a safeguard, uploaded-certs will be deleted in two hours; If necessary, you can use
"kubeadm init phase upload-certs --upload-certs" to reload certs afterward.

Then you can join any number of worker nodes by running the following on each as root:

kubeadm join proxy.openkube.io:6443 --token x03ngl.qxq1onlbo3wqleyj \
    --discovery-token-ca-cert-hash sha256:feb13a1f54d2ce1408692932821f79945c96e05c56efde0aba4d2529c1f3dd84
```
---------------------------------------------------------------------------------

Login onto master2 and master3 and run the below to join as control-pane

```
export HOST_NAME=$(hostname -A)

export IPADDR_ENP0S8=$(ifconfig enp0s8 | grep Mask | awk '{print $2}'| cut -f2 -d:)

kubeadm join proxy.openkube.io:6443 --token x03ngl.qxq1onlbo3wqleyj --discovery-token-ca-cert-hash sha256:feb13a1f54d2ce1408692932821f79945c96e05c56efde0aba4d2529c1f3dd84 --control-plane --certificate-key c90c6fd821d7ba31cd46fe0ca934ddcb6e6ec49c1a55ccdecda92a8c5a946001 --apiserver-advertise-address=$IPADDR_ENP0S8 --node-name $HOST_NAME --v=7
```
====================================================================================

Login onto worker node and run the below to join as worker

export HOST_NAME=$(hostname -A)

kubeadm join proxy.openkube.io:6443 --token x03ngl.qxq1onlbo3wqleyj --discovery-token-ca-cert-hash sha256:feb13a1f54d2ce1408692932821f79945c96e05c56efde0aba4d2529c1f3dd84  --node-name $HOST_NAME --v=7


===================================================================================

> https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/high-availability/

===================================================================================


export HOST_NAME=$(hostname -A)

export IPADDR_ENP0S8=$(ifconfig enp0s8 | grep Mask | awk '{print $2}'| cut -f2 -d:)

root@master1:~# kubeadm alpha certs certificate-key
8ca454cb5963a7fdf7cece7cbe63aad76437d2aad55e873249d8276c5ed7d487
root@master1:~#  


kubeadm init --kubernetes-version v1.17.0 --apiserver-advertise-address=$IPADDR_ENP0S8 --apiserver-cert-extra-sans=proxy.openkube.io,192.172.100.100,192.172.100.101,192.172.100.102,192.172.100.103  --node-name $HOST_NAME  --pod-network-cidr 10.10.0.0/16 --service-cidr  10.150.0.0/16  --control-plane-endpoint "proxy.openkube.io:6443" --upload-certs --certificate-key 8ca454cb5963a7fdf7cece7cbe63aad76437d2aad55e873249d8276c5ed7d487 --v=7


kubeadm token create --print-join-command
kubeadm join proxy.openkube.io:6443 --token yp01lr.kv43ouj77jv8aacx  --discovery-token-ca-cert-hash sha256:0fee5c0d03c0ad5bd14111f204bcd1eb537133af0c719bd5ac8f3f0205626eac 

=================================================================================
export HOST_NAME=$(hostname -A)

export IPADDR_ENP0S8=$(ifconfig enp0s8 | grep Mask | awk '{print $2}'| cut -f2 -d:)

kubeadm join proxy.openkube.io:6443 --token yp01lr.kv43ouj77jv8aacx --discovery-token-ca-cert-hash sha256:0fee5c0d03c0ad5bd14111f204bcd1eb537133af0c719bd5ac8f3f0205626eac  --control-plane --certificate-key 8ca454cb5963a7fdf7cece7cbe63aad76437d2aad55e873249d8276c5ed7d487 --apiserver-advertise-address=$IPADDR_ENP0S8   --node-name $HOST_NAME --v=7

=================================================================================
export HOST_NAME=$(hostname -A)

kubeadm join proxy.openkube.io:6443 --token yp01lr.kv43ouj77jv8aacx --discovery-token-ca-cert-hash sha256:0fee5c0d03c0ad5bd14111f204bcd1eb537133af0c719bd5ac8f3f0205626eac --node-name $HOST_NAME --v=7

kubectl apply -f https://docs.projectcalico.org/v3.11/manifests/calico.yaml

=======================================================

kubeadm alpha certs certificate-key

kubeadm init phase upload-certs --upload-certs --certificate-key=SOME_VALUE


========================================================

     