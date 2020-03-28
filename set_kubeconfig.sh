#!/bin/bash

if [ $# -ne 1 ]; then
  echo "set_kubeconfig.sh resource_group_name"
  exit
fi

export KUBECONFIG=`pwd`/_output/$1/kubeconfig/kubeconfig.southeastasia.json

