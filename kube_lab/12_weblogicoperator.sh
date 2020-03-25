cd /home/opc

docker login container-registry.oracle.com -u $ocontaineruser -p $ocontainerpassword
docker pull oracle/weblogic-kubernetes-operator:2.2.1

git clone https://github.com/oracle/weblogic-kubernetes-operator.git  -b release/2.2.1

cat << EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: helm-user-cluster-admin-role
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: default
  namespace: kube-system
EOF
kubectl create namespace operator
kubectl create serviceaccount -n operator weblogic-operator-sa

echo "Install operator, pls wait"

cd ./weblogic-kubernetes-operator/

helm install kubernetes/charts/weblogic-operator \
  --name weblogic-operator \
  --namespace operator \
  --set image=oracle/weblogic-kubernetes-operator:2.2.1 \
  --set serviceAccount=weblogic-operator-sa \
  --set "domainNamespaces={}" \
  --wait
  
kubectl get po -n operator
helm list
