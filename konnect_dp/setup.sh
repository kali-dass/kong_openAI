## Setup EKS for helm

# Create new name space
kubectl create namespace konnect

# Create the secret with certificates
kubectl create secret tls kong-cluster-cert -n konnect --cert=certs/dp1.crt --key=certs/dp1.key

# Deploy Dataplane connected to Konnect
helm install konnectdp kong/kong -n konnect --values helm_values/konnect_dp_values.yaml