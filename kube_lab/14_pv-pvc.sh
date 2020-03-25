rm -Rf /shared/logs

kubectl create namespace sampledomain
kubectl apply -f ./weblogic-sample-pv.yaml -n sampledomain
kubectl apply -f ./weblogic-sample-pvc.yaml  -n sampledomain
kubectl get pvc -n sampledomain
kubectl get pv -n sampledomain

mkdir -p /shared/logs/sampledomain