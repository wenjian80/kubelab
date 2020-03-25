# Install Docker Engine on the machine

yum install docker-engine

systemctl enable docker
systemctl start docker

docker login container-registry.oracle.com -u $1 -p $2


export KUBE_REPO_PREFIX=container-registry.oracle.com/kubernetes
echo 'export KUBE_REPO_PREFIX=container-registry.oracle.com/kubernetes' 


