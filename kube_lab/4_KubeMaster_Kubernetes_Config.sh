# Install the kubeadm package and its dependencies

/sbin/iptables -P FORWARD ACCEPT

/usr/sbin/setenforce 0

iptables-save > /etc/sysconfig/iptables

yum install kubeadm kubelet kubectl

kubeadm-setup.sh up

# Create the .kube subdirectory in your home directory

mkdir -p $HOME/.kube

# Create a copy of the Kubernetes admin.conf file in the .kube directory

sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

# Change the ownership of the file to match your regular user profile

sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Export the path to the file for the KUBECONFIG environment variable

export KUBECONFIG=$HOME/.kube/config

# Verify that you can use the kubectl command

kubectl get pods -n kube-system


# Get Token

token=`kubeadm token list | cut -d ' ' -f1`

# Get SSl 

output=`openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //'`
output="SSL : "$output

# Display Token and SSL

echo $token

echo $output



