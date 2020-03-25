echo 'BJ Work in progress to clean up environment'


echo 'Purge grafana and prometheus'
kubectl delete secret grafana-secret -n monitoring
helm del --purge grafana
helm del --purge prometheus


echo 'Purge weblogic domain'
kubectl delete -f domain.yaml -n sampledomain
kubectl delete ingress traefik-pathrouting-1 -n sampledomain
kubectl delete secret sample-domain1-weblogic-credentials -n sampledomain 
kubectl delete secret ocirsecret -n sampledomain

echo 'Purge pvc'
kubectl delete -f weblogic-sample-pvc.yaml  -n sampledomain
kubectl delete -f weblogic-sample-pv.yaml -n sampledomain
rm -Rf  /shared/logs

echo 'Purge operator / traefik  and all setup'
rm -Rf /home/opc/kube_lab/weblogic-kubernetes-operator

helm del --purge traefik-operator
helm del --purge weblogic-operator

kubectl delete clusterrolebinding helm-user-cluster-admin-role -n kube-system
kubectl delete serviceaccount sample-weblogic-operator-sa -n operator

kubectl delete serviceaccount tiller -n kube-system
kubectl delete clusterrolebinding tiller-cluster-rule -n kube-system

kubectl delete secret docker-registry -n kube-system
kubectl delete secret ora-registry -n kube-system

helm reset --force

kubectl delete namespace monitoring
kubectl delete namespace sampledomain
kubectl delete namespace operator
kubectl delete namespace traefik

echo 'run docker image ls, run docker rmi [iamge id] to purge the images'






