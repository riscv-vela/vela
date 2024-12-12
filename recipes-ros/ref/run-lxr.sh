#!/bin/bash

#docker run --name lxr -it -v /home/parallels/work/2306_0004_kernel_defender/repo/freedom-u-sdk:/source   -p 8001:80  hwchiu/docker-lxr:latest 172.17.0.1 linux

#docker run --name lxr-runtime -it -v /home/parallels/work/2306_0004_kernel_defender/repo/freedom-u-sdk:/source   -p 8002:80  lxr_runtime:latest 172.17.0.1 linux

#docker run --entrypoint "/bin/bash" --name lxr-runtime -it -v /home/parallels/work/2306_0004_kernel_defender/repo/freedom-u-sdk:/source   -p 8002:80  lxr_runtime:latest 

#docker run -d --name lxr-runtime -it --rm -v /home/parallels/work/2306_0004_kernel_defender/repo/freedom-u-sdk:/source   -p 8001:80  boggle70/lxr-runtime:latest 172.17.0.1 linux

docker run --name lxr-runtime -it --rm -v /home/parallels/work/2306_0004_kernel_defender/repo/freedom-u-sdk:/source   -p 8001:80  boggle70/lxr-runtime:latest 172.17.0.1 linux
