

#ssh 192.168.1.142 mkdir ~/.ssh
#scp ~/.ssh/id_rsa.pub 192.168.1.142:~/.ssh/authorized_keys

ansible-playbook -i inventory/mycluster/inventory.ini scale.yml -b -v \
  --private-key=~/.ssh/private_key --skip-tags kube-proxy --ask-pass --ask-become-pass
