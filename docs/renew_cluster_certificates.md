### Check certificate expiration
kubeadm alpha certs check-expiration 


### Renew the certs (all certs)
kubeadm alpha certs renew all    


### Upload control-plane certificates to the kubeadm-certs Secret
kubeadm init phase upload-certs --upload-certs


## verify cluster
