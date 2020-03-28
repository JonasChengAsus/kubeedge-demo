#!/bin/bash

sudo $GOPATH/src/github.com/kubeedge/kubeedge/build/tools/certgen.sh genCertAndKey edge

sudo sh -c "cd /etc/kubeedge/ && tar cvzf ca.tgz ca && tar cvzf certs.tgz certs"

sudo mv /etc/kubeedge/ca.tgz .
sudo mv /etc/kubeedge/certs.tgz .

sudo chmod a+r *.tgz


