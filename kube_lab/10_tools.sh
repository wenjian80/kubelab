source /root/.bashrc

yum install git
sudo yum install helm

docker login container-registry.oracle.com -u $ocontaineruser -p $ocontainerpassword

kubectl create secret docker-registry ora-registry --namespace kube-system --docker-server=container-registry.oracle.com  --docker-username=$ocontaineruser --docker-password=$ocontainerpassword
  
kubectl create -f - <<EOF 
apiVersion: v1 
kind: ServiceAccount 
metadata: 
  name: tiller 
  namespace: kube-system 
imagePullSecrets: 
  - name: ora-registry 
EOF

kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
helm init --service-account tiller --tiller-image container-registry.oracle.com/kubernetes_developer/tiller:v2.9.1
#kubectl --namespace=kube-system set image deployments/tiller-deploy tiller=gcr.io/kubernetes-helm/tiller:v2.9.1
sleep 20
echo " Tiller Installed on Kube Cluster "
kubectl get po -n kube-system
echo "Git -version"
git --version
#helm reset
sleep 20
helm version
