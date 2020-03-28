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

```shell
sh ./install_golang.sh
source set_goenv.sh
```

## Build EdgeController

```shell
sh ./setup_cloud_node.sh

```

## Generate Certs

```shell
sh ./gen_certs.sh

```

## Start EdgeController

```shell
sh ./start_edgecontroller.sh

```

# Install KubeEdge in Edge Node

## Upload ca.tgz and certs.tgz to /etc/kubeedge

```shell
sudo su
cd /etc
mkdir kubeedge
# upload ca.tgz and certs.tgz
tar xvzf ca.tgz
tar xvaf certs.tgz
exit

```
