#!/bin/bash

sudo rm -r sftp
git clone https://github.com/ranjanprj/sftp
cd sftp
docker rmi mysftp
docker build -t mysftp .
# docker kill mytest
# docker rm mytest
# docker run --name mytest -t microsvcone:latest -p 8888:8888 
# minikube image load microsvcone:latest