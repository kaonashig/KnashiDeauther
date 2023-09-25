#!/bin/bash

### Colors ###
BK=$(tput setaf 0) # Black
GR=$(tput setaf 2) # Green
RD=$(tput setaf 1) # Red
YW=$(tput setaf 3) # Yellow
CY=$(tput setaf 6) # Cyan
WH=$(tput setaf 7) # White
NT=$(tput sgr0) # Netral
BD=$(tput bold) # Bold
BG=$(tput setab 4) # Background Color

# Checking root
function chk_root () {
	if [[ "$(id -u)" -ne 0 ]]; then
		clear
		printf " ${BD}${WH}[${RD}!${WH}] ${RD}This tool must be run as root ${YW}賢いn"
		exit 1
	fi
}

# Dependencies
function checking_dependencies () {
	clear
	banner
	if [[ -f "dependencies.conf" ]]; then
		sleep 1
	else
		printf " ${BD}${WH}[${RD}!${WH}] ${CY}Loading our weapons ${WH}..........\n"
		echo ""
		touch dependencies.conf
		echo "# Smert Just Dropped Your Wireless" >> dependencies.conf
		sleep 1

		# Checking MDK3
		which mdk3 > /dev/null 2>&1
		if [[ $? -eq 0 ]]; then
			printf " ${YW}MDK3 ${WH}.......... ${WH}[${GR}✔${WH}]\n"
			echo "mdk3 = yes" >> dependencies.conf
		else
			printf " ${YW}MDK3 ${WH}.......... ${WH}[${RD}✘${WH}]\n"
			sleep 1
			apt-get install mdk3 -y
		fi

		# Checking Network Manager
		which nmcli > /dev/null 2>&1
		if [[ $? -eq 0 ]]; then
			printf " ${YW}Network Manager ${WH}.......... ${WH}[${GR}✔${WH}]\n"
			echo "nmcli = yes" >> dependencies.conf
		else
			printf " ${YW}Network Manager ${WH}.......... ${WH}[${RD}✘${WH}]\n"
			sleep 1
			apt-get install network-manager -y
		fi

		# Checking MAC Changer
		which macchanger > /dev/null 2>&1
		if [[ $? -eq 0 ]]; then
			printf " ${YW}MAC Changer ${WH}.......... ${WH}[${GR}✔${WH}]\n"
			echo "macchanger = yes" >> dependencies.conf
		else
			printf " ${YW}MAC Changer ${WH}.......... ${WH}[${RD}✘${WH}]\n"
			sleep 1
			apt-get install macchanger -y
		fi
		sleep 5		
	fi
}

chk_root
checking_dependencies
printf " \n ${WH}[${GR}✔${WH}] ${GR}We are ready! Happy Hacking!\n"
