#!/bin/bash

mkdir OS_details #create directory OS_details
hostname >> OS_details/info.txt #writes host name to text file
uname -r >> OS_details/info.txt #writes kernel version and architecture to text file
lscpu | grep 'CPU family' | awk '{print $3}' >> OS_details/info.txt #writes CPU family to text file
lscpu | grep 'CPU max MHz' | awk '{print $4}' >> OS_details/info.txt #writes CPU MHz to text file
lscpu | grep 'Core(s) per socket' | awk '{print $4}' >> OS_details/info.txt #writes number of cores to text file
free -h | awk 'FNR == 2 {print $7}' >> OS_details/info.txt #writes RAM available to text file
free -h | awk 'FNR == 2 {print $3}' >> OS_details/info.txt #writes RAM used to text file
df -H / | awk 'FNR == 2 {print $3}' >> OS_details/info.txt #writes Hard Disk space used mounted on / to text file






