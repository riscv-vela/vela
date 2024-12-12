#!/bin/bash
set -e

read -p "Enter target sd device name : " input_dev
echo ""

read -p "/dev/$input_dev  confirm press y : " userInput
echo ""

userInputLower=$(echo "$userInput" | tr '[:upper:]' '[:lower:]')

if [ "$input_dev" != "sdb" ]; then
    echo "target is not sdb"
    exit 1
fi

if [ "$userInputLower" = "y" ]; then
	
	if [ ! -b "/dev/$input_dev" ]; then
		echo "/dev/$input_dev is not exist... bye!"
		exit 1
	fi
	
    echo "Start flash write..."
    echo "dd if=work/bbl.bin of=/dev/$input_dev bs=4096"
    echo "..."

    dd if=work/bbl.bin of=/dev/$input_dev bs=4096
    
    echo "done..."

else
    echo "Cancel job process..."
    exit 1
fi


