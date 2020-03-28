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

## Install Docker

```shell
sh get-docker.sh
```

## Install Go

```shell
sh ./install_golang.sh
source set_goenv.sh

```

## Pull Docker Image of EdgeCore

```shell
sh ./setup_edge_node.sh

```

## Start EdgeCore

```shell
cd $GOPATH/src/github.com/kubeedge/kubeedge/build/edge
./run_daemon.sh only_run_edge mqtt=0.0.0.0:1883 cloudhub=0.0.0.0:10000 edgename=node image="kubeedge/edgecore:latest" containername=container
```

Use the above command to deploy created edge node inside container.

Replace 0.0.0.0 in cloudhub with the ip of the machine where cloud is running.

Replace node with name of node created.

Replace container with name desired for container.
