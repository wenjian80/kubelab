helm install --wait --name prometheus --namespace monitoring --values  prometheus_values.yaml stable/prometheus
kubectl --namespace monitoring create secret generic grafana-secret --from-literal=username=weblogic --from-literal=password=welcome1
helm install --wait --name grafana --namespace monitoring --values grafana_values.yaml stable/grafana
kubectl get po -n monitoring -o wide
kubectl get svc -n monitoring -o wide
sleep 2
