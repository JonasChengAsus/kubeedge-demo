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

## Test K8S Cluster is Accessible

```shell
kubectl cluster-info
# there should be at least one master and one agentpool node in Ready status
kubectl get nodes -A
```

# Install KubeEdge in Master Node

* Enable Network Security Group to allow websocket via port 10000.
* Enable Public Load Balancer to forward websocket to master node via port 10000 as well.
* Get master node IP

## Pull Script from Github

```shell
# ssh to the master node
ssh azureuser@MASTER-NODE-IP
git clone https://github.com/JonasChengAsus/kubeedge-demo.git
cd kubeedge-demo
```

## Install Go and Setup GO Environments

```shell
sh ./install_golang.sh
# setup go environments
source set_goenv.sh
```

## Setup KubeEdge v1.2

```shell
# install keadm
go get github.com/kubeedge/kubeedge/keadm/cmd/keadm
# init edgecontroller
sudo $GOPATH/bin/keadm init --kube-config ~azureuser/.kube/config
```

Sample execution output

```console
Kubernetes version verification passed, KubeEdge installation will start...
...
Getting CA Private Key

Certificates got generated at: /etc/kubeedge/ ca and /etc/kubeedge/ certs
certs/
certs/edge.crt
certs/edge.key
certs/edge.csr

Certificates got tared at: /etc/kubeedge/ path, Please copy it to desired edge node (at /etc/kubeedge/ path)

KubeEdge cloudcore is running, For logs visit:  /var/log/kubeedge/cloudcore.log
CloudCore started
```

## Copy and Download certs.tgz

```shell
sudo cp /etc/kubeedge/certs.tgz .
sudo chmod a+r certs.tgz
# scp certs.tgz to local host
```

## Legacy way to Setup KubeEdge v1.0.0

> ## Build EdgeController
> 
> ```shell
> sh ./setup_cloud_node.sh
> 
> ```
> 
> ## Generate Certs
> 
> ```shell
> sh ./gen_certs.sh
> 
> ```
> 
> ## Start EdgeController
> 
> ```shell
> cd $GOPATH/src/github.com/kubeedge/kubeedge/cloud
> sudo ./edgecontroller &
> 
> ```
> 
> ## Create Edge Node
> 
> Modify the $GOPATH/src/github.com/kubeedge/kubeedge/build/node.json file. 
Change metadata.name to name of the edge node to deploy.
> 
> ```shell
> nano $GOPATH/src/github.com/kubeedge/kubeedge/build/node.json 
> kubectl apply -f $GOPATH/src/github.com/kubeedge/kubeedge/build/node.json
> 
> ```

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
sudo ./run_daemon.sh only_run_edge mqtt=0.0.0.0:1883 cloudhub=0.0.0.0:10000 edgename=node image="kubeedge/edgecore:latest" containername=container
```

Use the above command to deploy created edge node inside container.

Replace 0.0.0.0 in cloudhub with the ip of the machine where cloud is running.

Replace node with name of node created.

Replace container with name desired for container.
