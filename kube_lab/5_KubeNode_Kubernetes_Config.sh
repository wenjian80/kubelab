# Install the kubeadm package and its dependencies

yum install kubeadm kubelet kubectl

/sbin/iptables -P FORWARD ACCEPT

/usr/sbin/setenforce 0

iptables -P FORWARD ACCEPT
swapoff -a
/usr/sbin/setenforce 0
iptables-save > /etc/sysconfig/iptables

# execute kubeadm-setup.sh command

# Replace the IP address and port, 192.0.2.10:6443, with the IP address and port that is used by the API Server (the master node). Note that the default port is 6443
# Replace the --token value, 8tipwo.tst0nvf7wcaqjcj0, with a valid token for the master node.
# Replace the --discovery-token-ca-cert-hash value, f2a5b22b658683c3634459c8e7617c9d6c080c72dd149f3eb903445efe9d8346, with the correct SHA256 CA certificate hash that is used to sign the token certificate for the master node.

kubeadm-setup.sh join 10.0.0.2:6443 --token 01guf8.v05ie94748q9ymtj --discovery-token-ca-cert-hash sha256:161dc4ead2037f3ae6637f1c59dcf5fbf3913ab9b7110d79bd8e8dcb9a749143
