#!/bin/bash

git clone https://github.com/kubeedge/kubeedge.git $GOPATH/src/github.com/kubeedge/kubeedge

cd $GOPATH/src/github.com/kubeedge/kubeedge

git checkout v1.0.0

cd $GOPATH/src/github.com/kubeedge/kubeedge/cloud/

make


