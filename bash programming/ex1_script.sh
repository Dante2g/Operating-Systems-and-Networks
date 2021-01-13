#!/bin/bash

for i in {19..16} #loops through 'nodes'
do
	ping -c 1 149.170.10.$i #pings node
	if [ $? -eq 0 ]; then #checks return value of ping command if code '0' then success else no reply or errors.
	echo "node 149.170.10.$i is on" >> ./ping_test.txt #writes status to ping_test.txt
	else
	echo "node 149.170.10.$i is off" >> ./ping_test.txt 
	fi #end if
done #end loop


