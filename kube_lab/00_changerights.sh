# Change rights and sed special chracter

sudo su

chmod -R 777 /home/opc/kube_lab

sed -i -e "s/^M//" /home/opc/kube_lab/*.sh
sed -i -e 's/\r$//' /home/opc/kube_lab/*.sh

sed -i -e "s/^M//" /home/opc/kube_lab/*.yaml
