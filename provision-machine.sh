echo "--- Checking vagrant plugin ---"
echo "-------------------------------"
[ $(vagrant plugin list | grep vagrant-hostmanager | wc -l) != 1 ] && vagrant plugin install vagrant-hostmanager 
[ $(vagrant plugin list | grep vagrant-vbguest | wc -l) != 1 ] && vagrant plugin install vagrant-vbguest


echo "--- creating data directory ---" 
echo "-------------------------------"
mkdir -p ../data/


echo "--- provisioning virtual machines ---"
echo "-------------------------------------"
vagrant up 


read -p "Press enter to continue"
