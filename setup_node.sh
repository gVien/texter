#!/bin/bash

LOCAL_DIR=/usr/local

cd $LOCAL_DIR

curl -O https://nodejs.org/dist/v6.10.0/node-v6.10.0-linux-x64.tar.xz
tar -xf node-v6.10.0-linux-x64.tar.xz

echo "export NODE=/usr/local/node-v6.10.0-linux-x64" >> /etc/profile
echo "PATH=$PATH:$NODE/bin" >> /etc/profile
