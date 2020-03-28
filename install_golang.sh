#!/bin/bash

GOPACKAGE=go1.13.3.linux-amd64.tar.gz

sudo apt-get update
sudo apt-get -y upgrade

wget https://dl.google.com/go/$GOPACKAGE
sudo tar -xvf $GOPACKAGE
sudo mv go /usr/local


