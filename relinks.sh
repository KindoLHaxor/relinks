#!/usr/bin/bash
#FellFreeToRecode
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'
BlueF='\e[1;34m'
LIMITATOR=5
clear
BANNERS () {
printf "${lightgreen}
#####################################################\n 
                  ${yellow}Coded By ./KindoL
                ===================== 
${lightgreen}
 _  ___           _       _     
| |/ (_)_ __   __| | ___ | |    
|   /| |  _ \ / _  |/ _ \| |    
| . \| | | | | (_| | (_) | |___ 
|_|\_\_|_| |_|\__._|\___/|_____| \n
${white}AUTO CHECK CREATE LINK WITH WORDLIST    
${lightgreen}=====================================================\n
${BlueF}root@Date :~$ ${cyan}$(date) \n
${BlueF}#!/system/bin/bash Linux Android x86_64 
${lightgreen}
=====================================================\n
\n                                              
"
}
BANNERS
OPTIONS () {
printf "${red}[=]${white} List                        :${lightgreen} "
read list


source="<html>"

printf "${red}[=]${white} Save As                     :${lightgreen} "
read save
site=$(cat $list)
}
OPTIONS


spinner()
{
    local pid=$1
    local delay=0.01
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

(sleep 3) &
printf "Wait..."
spinner $!
printf "\n"
for site in $(cat $list);
do
((cthread=cthread%LIMITATOR)); ((cthread++==0)) && wait
if [[ $(curl --connect-timeout 0 --max-time 10 -kLs "${site}.com" ) =~ "${source}" ]];
then
  printf "${white}[+] ${site}.com is ${lightgreen} OK\n"
  echo "$site.com" >> ${save}

elif [[ $(curl --connect-timeout 0 --max-time 10 -kLs "${site}.net" ) =~ "${source}" ]];
then
  printf "${white}[+] ${site}.net is ${lightgreen} OK\n"
  echo "$site.net" >> ${save}

elif [[ $(curl --connect-timeout 0 --max-time 10 -kLs "${site}.org" ) =~ "${source}" ]];
then
  printf "${white}[+] ${site}.org is ${lightgreen} OK\n"
  echo "$site.org" >> ${save}

else
  printf "${white}[-] ${site} is ${red} BAD\n"
fi
done
printf "\n${lightgreen}Save as ${save}...\n\n"
