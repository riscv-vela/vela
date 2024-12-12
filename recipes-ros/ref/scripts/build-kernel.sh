#!/bin/bash

set -e

touch work/linux/.config

make vmlinux -j8

make bbl -j8

make bin -j8

