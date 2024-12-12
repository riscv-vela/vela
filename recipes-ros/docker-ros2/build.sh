#!/bin/bash

docker images
echo ""
cur_version='etri-riscv-ros2:22.04'
echo "Current version is $cur_version"
echo "Enter build version:"
read input_string

echo "build string : $cur_version.$input_string"

docker build -f Dockerfile -t $cur_version.$input_string .

