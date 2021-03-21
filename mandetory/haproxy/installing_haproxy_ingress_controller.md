
# Official haproxy kubernetes ingress 
# https://github.com/haproxytech/helm-charts/tree/kubernetes-ingress-1.12.0/kubernetes-ingress
# Refer the below values.yaml for more customization on ingress controller
# https://github.com/haproxytech/helm-charts/blob/master/kubernetes-ingress/values.yaml


helm repo add haproxytech https://haproxytech.github.io/helm-charts

helm repo update

helm pull haproxytech/kubernetes-ingress --version 1.5.0

cat << EOF | helm install haproxy kubernetes-ingress-1.5.0.tgz --values - 
controller:
  kind: DaemonSet
  service:
    nodePorts:
      http: 30080
      https: 30443
      stat: 31024
  nodeSelector:
    infra/proxy: "true"
  tolerations:
  - key: node-role.kubernetes.io/master
    effect: NoSchedule
    operator: "Exists"
EOF


cat << EOF | kubectl apply -f -
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: haproxy-ingress-stats
spec:
  rules:
  - host: haproxy-stat.app.openkube.io
    http:
      paths:
      - path: /
        backend:
          serviceName: haproxy-kubernetes-ingress
          servicePort: 1024
EOF


# helm delete haproxy