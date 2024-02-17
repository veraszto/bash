#! /bin/bash

partition=/dev/sdb
table=msdos
filesystem=fat32
partitiontype=primary
name=Name

sudo parted $partition print
echo "Ensure you are dealing with the correct partition"
read 

sudo parted $partition mktable $table 
sudo parted $partition mkpart $partitiontype $filesystem 2048s 100%
sudo parted $partition print
sudo mkfs.fat -F 32 ${partition}1 -n $name

