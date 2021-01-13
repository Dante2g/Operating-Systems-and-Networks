#!/bin/bash
mkdir nodes_details
ssh-keygen #generates ssh key
j=0 #counter used for text file naming
for i in {19..16} #loops through nodes
do
	((j=j+1)) #increment counter
	ssh-copy-id 18026172@149.170.10.$i  #copy ssh key to other nodes, this is so password only has to be entered once
	ssh 18026172@149.170.10.$i hostname >> nodes_details/node${j}.txt #ssh into current node and write hostname to the nodes text file
	ping -c 1 149.170.10.$i #ping current node
	if [ $? -eq 0 ]; then #checks return value of ping command if code '0' then success else no reply or errors.
	echo "node $j (149.170.10.$i) is on" >> nodes_details/node${j}.txt #writes status to text file
	else
	echo "node $j (149.170.10.$i) is off" >> nodes_details/node${j}.txt
	fi
	ssh 18026172@149.170.10.$i uname -r >> nodes_details/node${j}.txt #ssh into current node and write kernel version and architecture to the nodes text file
	ssh 18026172@149.170.10.$i lscpu | grep 'CPU family' | awk '{print $3}' >> nodes_details/node${j}.txt #ssh into current node and write CPU family to the nodes text file
	ssh 18026172@149.170.10.$i lscpu | grep 'CPU max MHz' | awk '{print $4}' >> nodes_details/node${j}.txt
	ssh 18026172@149.170.10.$i lscpu | grep 'Core(s) per socket' | awk '{print $4}' >> nodes_details/node${j}.txt
	ssh 18026172@149.170.10.$i free -h | awk 'FNR == 2 {print $7}' >> nodes_details/node${j}.txt #ssh into current node and write RAM available to text file
	ssh 18026172@149.170.10.$i free -h | awk 'FNR == 2 {print $3}' >> nodes_details/node${j}.txt
	ssh 18026172@149.170.10.$i df -H / | awk 'FNR == 2 {print $3}' >> nodes_details/node${j}.txt
	
done


