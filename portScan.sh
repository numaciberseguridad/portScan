#!/bin/bash

trap ctrl_c INT

function ctrl_c(){
	echo -e "\n\n[*] Exiting...\n"
	tput cnorm; exit 0
}

tput civis; for port in $(seq 1 65535); do
	timeout 1 bash -c "echo '' </dev/tcp/$1/$port" 2>/dev/null && echo "Port $port - OPEN" &
done; wait

tput cnorm
