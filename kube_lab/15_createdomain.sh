kubectl -n sampledomain create secret generic sample-domain1-weblogic-credentials --from-literal=username=weblogic --from-literal=password=welcome1


kubectl label secret sample-domain1-weblogic-credentials   -n sampledomain  weblogic.domainUID=sample-domain1  weblogic.domainName=sample-domain1


kubectl create secret docker-registry ocirsecret --docker-server=iad.ocir.io --docker-username=$ociruser --docker-password=$ocirpass --docker-email='boon.jian.lim@oracle.com' -n sampledomain

helm upgrade   --reuse-values   --set "domainNamespaces={sampledomain}"   --wait   weblogic-operator  weblogic-operator/weblogic-operator

helm upgrade --reuse-values   --set "kubernetes.namespaces={traefik,sampledomain}" --wait traefik-operator stable/traefik

kubectl apply -f /home/opc/kube_lab/domain.yaml

sleep 2 

kubectl get pod -n sampledomain

sleep 20

kubectl get po -n sampledomain -o wide
cat << EOF | kubectl apply -f -
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: traefik-pathrouting-1
  namespace: sampledomain
  annotations:
    kubernetes.io/ingress.class: traefik
spec:
  rules:
  - host:
    http:
      paths:
      - path: /
        backend:
          serviceName: sample-domain1-cluster-cluster-1
          servicePort: 8001
      - path: /console
        backend:
          serviceName: sample-domain1-admin-server
          servicePort: 7001          
EOF


