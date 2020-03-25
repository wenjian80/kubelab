cd ./weblogic-kubernetes-operator/
helm install stable/traefik --name traefik-operator --namespace traefik --values kubernetes/samples/charts/traefik/values.yaml  --set "kubernetes.namespaces={traefik}" --set "serviceType=NodePort" 
sleep 20
kubectl get service -n traefik
sleep 1
helm list
