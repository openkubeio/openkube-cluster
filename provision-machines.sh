
echo "--- Checking vagrant plugin ---"
     [ $(vagrant plugin list | grep vagrant-hostmanager | wc -l) != 1 ] && vagrant plugin install vagrant-hostmanager 
     [ $(vagrant plugin list | grep vagrant-vbguest | wc -l) != 1 ] && vagrant plugin install vagrant-vbguest

echo "--- creating data directory ---" 
     mkdir -p ../data/

echo "--- provisioning virtual machines ---"
     vagrant up --provider=virtualbox

read -p "Press enter to continue"
