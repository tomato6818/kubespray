mkdir dev
cd dev/
ll
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install -y git sshpass python3.11 python3.11-venv python3.11-dev
python3.11 -m venv ~/venvs/kubespray-env
source ~/venvs/kubespray-env/bin/activate

git clone https://github.com/kubernetes-sigs/kubespray.git
cd kubespray/
git checkout release-2.27
git pull
pip install --upgrade pip
pip install -r requirements.txt
cp -rfp inventory/sample inventory/mycluster

#vi inventory/mycluster/inventory.ini 
#vi inventory/mycluster/group_vars/k8s_cluster/k8s-cluster.yml 

ansible-playbook -i inventory/mycluster/inventory.ini cluster.yml -b -v \
  --private-key=~/.ssh/private_key --skip-tags kube-proxy --ask-pass --ask-become-pass
