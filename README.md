# Install AKS-Engine


## macOS

```shell
brew install Azure/aks-engine/aks-engine
```

## Linux

```shell
curl -o get-akse.sh https://raw.githubusercontent.com/Azure/aks-engine/master/scripts/get-akse.sh
sh ./get-akse.sh
```

# Deploy K8S Cluster in Azure

## Deploy K8S Cluster

```shell
aks-engine deploy --subscription-id SUBSCRIPTION-ID --client-id 'CLIENT-ID' --client-secret 'CLIENT-SECRET' --dns-prefix DNS-PREFIX --location LOCATION --api-model kubernetes.json

```

## Export K8S Config

```shell
source set_kubeconfig.sh RESOURCE-GROUP-NAME

```

## Test K8S Cluster

```shell
kubectl get nodes -A
```

# Install KubeEdge in Master Node

## Install Go

```
sh ./install_golang.sh
source set_goenv.sh
```

