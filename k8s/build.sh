#!/bin/bash

rm -r files
mkdir files
cd files
wget http://$ipaddr:8000/sftp/files/create-sftp-user
wget http://$ipaddr:8000/sftp/files/entrypoint.sh
wget http://$ipaddr:8000/sftp/files/sshd_config

cd ..

rm Dockerfile
wget http://$ipaddr:8000/sftp/Dockerfile
docker rm mysftp
docker build -t mysftp .
# docker kill mytest
# docker rm mytest
# docker run --name mytest -t microsvcone:latest -p 8888:8888 
# minikube image load microsvcone:latest