
### Restore Strategy for Internal Etcd Cluster:

docker run --rm \
-v '/data/backup:/backup' \
-v '/var/lib/etcd:/var/lib/etcd' \
--env ETCDCTL_API=3 \
'k8s.gcr.io/etcd:3.4.3-0' \
/bin/sh -c "etcdctl snapshot restore '/backup/etcd-snapshot-2018-12-09_11:12:05_UTC.db' ; mv /default.etcd/member/ /var/lib/etcd/"

kubeadm init --ignore-preflight-errors=DirAvailable--var-lib-etcd


