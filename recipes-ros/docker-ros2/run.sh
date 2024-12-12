#!/bin/bash

docker images
echo ""
cur_version='etri-riscv-ros2:22.04'
minor_version='01'
echo "running container : $cur_version.$minor_version"

docker run -v /home/parallels/work/:/work --rm -it $cur_version.$minor_version /bin/bash

