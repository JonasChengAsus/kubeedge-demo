#!/bin/bash

sudo $GOPATH/src/github.com/kubeedge/kubeedge/build/tools/certgen.sh genCertAndKey edge

sudo sh -c "cd /etc/kubeedge/ && tar cvzf ca.tgz ca && tar cvzf certs.tgz certs"

sudo cp /etc/kubeedge/ca.tgz .
sudo cp /etc/kubeedge/certs.tgz .

sudo chmod a+r *.tgz


