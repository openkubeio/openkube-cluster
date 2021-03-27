### Check certificate expiration
kubeadm alpha certs check-expiration 


### Renew the certs (all certs)
kubeadm alpha certs renew all    


### Upload control-plane certificates to the kubeadm-certs Secret
kubeadm init phase upload-certs --upload-certs


## testing 

for i in 192.172.100.101 192.172.100.102 192.172.100.103 192.172.100.104 192.172.100.105; 
do ssh vagrant@$i 'sudo kubeadm alpha certs check-expiration' ; 
done

for i in 192.172.100.100 192.172.100.101 192.172.100.102 192.172.100.103 192.172.100.104 192.172.100.105; 
do ssh vagrant@$i 'sudo timedatectl set-ntp 1'  ;
done

for i in 192.172.100.100 192.172.100.101 192.172.100.102 192.172.100.103 192.172.100.104 192.172.100.105; 
do ssh vagrant@$i 'sudo timedatectl set-ntp 0'  ;
done

for i in 192.172.100.100 192.172.100.101 192.172.100.102 192.172.100.103 192.172.100.104 192.172.100.105; 
do ssh vagrant@$i 'sudo timedatectl set-time 2022-03-22';
done

for i in 192.172.100.100 192.172.100.101 192.172.100.102 192.172.100.103 192.172.100.104 192.172.100.105;  
do ssh vagrant@$i 'sudo timedatectl status |grep time'  ;
done


for i in 192.172.100.100 192.172.100.101 192.172.100.102 192.172.100.103 192.172.100.104 192.172.100.105;  
do ssh vagrant@$i 'sudo timedatectl status |grep time'  ;
done

for i in 192.172.100.101 192.172.100.102 192.172.100.103;  
do ssh vagrant@$i 'sudo kubeadm alpha certs check-expiration '  ;
done
