# !/bin/bash
# -*- coding: utf-8 -*-
# CODED BY DEVILMASTER
# Please coppy with proper credits


# Source 1 stats - updated once a day from John Hopkins University
# https://corona-stats.online

# ---------------------------------------------------------------------------------

# (DEFAULT SOURCE)
# Source 2 stats - updated every 15 minutes from worldometers.info
# https://corona-stats.online?source=2

# ---------------------------------------------------------------------------------

# Country wise stats

## Format:
# https://corona-stats.online/[countryCode]
# https://corona-stats.online/[countryName]

## Example: From source 1
# https://corona-stats.online/Italy?source=1
# https://corona-stats.online/UK?source=1

## Example: From source 2 (DEFAULT)
# https://corona-stats.online/italy
# https://corona-stats.online/italy?source=2
# https://corona-stats.online/UK?source=2
# https://corona-stats.online/UK

# ---------------------------------------------------------------------------------

# State wise api (Only for US as of now)

## Format:
# https://corona-stats.online/states/[countryCode]
# https://corona-stats.online/states/[countryName]

## Example: From source 1
# https://corona-stats.online/us
# https://corona-stats.online/USA?format=json
# https://corona-stats.online/USA?minimal=true

# ---------------------------------------------------------------------------------

# Minimal Mode - remove the borders and padding from table

## Example:
# https://corona-stats.online?minimal=true
# https://corona-stats.online/Italy?minimal=true           (with country filter)
# https://corona-stats.online?minimal=true&source=1        (with source)
# https://corona-stats.online/uk?source=2&minimal=true     (with source and country)

---------------------------------------------------------------------------------

# Get data as JSON - Add ?format=json

## Example:
# https://corona-stats.online?format=json
# https://corona-stats.online/Italy?format=json            (with country filter)
# https://corona-stats.online/?source=2&format=json        (with source)
# https://corona-stats.online/uk?source=2&format=json      (with source and country)

---------------------------------------------------------------------------------

# Get top N countries - Add ?top=N

## Example:
# https://corona-stats.online?top=25
# https://corona-stats.online?source=1&top=10               (with source)
# https://corona-stats.online/uk?minimal=true&top=20        (with minimal)


# ---------------------------------------------------------------------------------

# Confirmed Cases Graph (WIP)

## Format:
# https://corona-stats.online/[countryName]/graph
# https://corona-stats.online/[countryCode]/graph

## Example:
# https://corona-stats.online/italy/graph
# https://corona-stats.online/china/graph


function dependencies(){
command -v curl > /dev/null 2>&1 || { echo >&2 "package curl is not installed ... Aborting ..."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "package wget is not installed ... Aborting ..."; exit 1; }
}

function author(){
echo -e "\n    \e[1;37m  [\e[1;31m+\e[1;37m]   DEVELOPED BY DEVIL MASTER \e[1;37m  [\e[1;31m+\e[1;37m]"
echo -e "    \e[1;37m  [\e[1;31m+\e[1;37m]      github.com/isuruwa     \e[1;37m  [\e[1;31m+\e[1;37m]\n"
}

function back(){
echo -n -e "\n\033[35m  [\e[1;37m+\033[35m]\e[1;37m Press Enter To Continue"
read
menu
}

function chk(){
clear
git pull
echo -e "\033[35m  [\e[1;37m+\033[35m]\e[1;31m Note - If You Using Termux , Recommaned To Rotate To Landscape Mode\n"
echo -e "\033[35m  [\e[1;37m+\033[35m]\e[1;32m Press Enter To Continue : "
read
}

function menu() {
clear
figlet -f smmono9 "CoronaStat-Bot" | lolcat
author
echo -e "\033[35m  [\e[1;37m1\033[35m]\e[1;32m LK Corona Stats"
echo -e "\033[35m  [\e[1;37m2\033[35m]\e[1;33m World Corona Stats"
echo -e "\033[35m  [\e[1;37m3\033[35m]\e[1;31m Country Wise Corona Stats"
echo -e "\033[35m  [\e[1;37m4\033[35m]\033[1;35m Top Number based Corona Stats"
echo -e "\033[35m  [\e[1;37m5\033[35m]\e[1;34m State based Corona Stats"
echo -e "\033[35m  [\e[1;37m6\033[35m]\e[0;36m Advanced"
echo -e "\033[35m  [\e[1;37m7\033[35m]\e[1;31m Exit\n"
echo -n -e "\033[35m  [\e[1;37m+\033[35m]\e[1;37m Enter Choice : "
read choice
if [ "${choice:-}" = "1" ]
then
     lk
     back
elif [ "${choice:-}" = "2" ]
then
     world
     back
elif [ "${choice:-}" = "3" ]
then
     country
     back
elif [ "${choice:-}" = "4" ]
then
     number
     back
elif [ "${choice:-}" = "5" ]
then
     state
     back
elif [ "${choice:-}" = "6" ]
then
     advanced
elif [ "${choice:-}" = "7" ]
then
     echo -e "\n\e[1;37m  [\e[1;31m+\e[1;37m] STAY SAFE ! \e[1;37m  [\e[1;31m+\e[1;37m]"
     echo -e "\e[1;37m  [\e[1;31m+\e[1;37m] EXPECT US ! \e[1;37m  [\e[1;31m+\e[1;37m]"
     sleep 1
     exit 0
elif [ "${choice:-}" = "" ]
then
     menu
else
    echo -e  "\033[35m  [\033[33m*\033[35m]\e[1;31m Wrong Choice"
    sleep 2
    menu
fi
}

function source(){
echo -e "\n\033[35m  [\e[1;37m+\033[35m]\e[1;37m Select Source\n"
echo -e "\033[35m  [\e[1;37m1\033[35m]\e[1;32m Source 1"
echo -e "\033[35m  [\e[1;37m2\033[35m]\e[1;32m Source 2\n"
echo -n -e "\033[35m  [\e[1;37m+\033[35m]\e[1;37m Enter Your option :  "
read userinput1
}

function lk(){
clear
figlet -f smmono9 "  Lk-Corona" | lolcat
figlet -f smmono9 "    Stat" | lolcat
author
source
if [ "${userinput1:-}" = "1" ]
then
    curl https://corona-stats.online/LK?source=1
elif [ "${userinput1:-}" = "2" ]
then
    curl https://corona-stats.online/LK?source=2
elif [ "${userinput1:-}" = "" ]
then
    lk
else
    echo -e "\033[35m  [\e[1;37m!\033[35m]\e[1;31m Wrong Choice"
    sleep 2
    menu
fi
}

function world(){
clear
figlet -f smmono9 " World-Corona" | lolcat
figlet -f smmono9 "    Stat"  | lolcat
author
source
if [ "${userinput1:-}" = "1" ]
then
    curl https://corona-stats.online?source=1
elif [ "${userinput1:-}" = "2" ]
then
    curl https://corona-stats.online?source=2
elif [ "${userinput1:-}" = "" ]
then
    lk
else
    echo -e "\033[35m  [\e[1;37m!\033[35m]\e[1;31m Wrong Choice"
    sleep 2
    menu
fi
}

function country(){
clear
figlet -f smmono9 "Country-Based" | lolcat
figlet -f smmono9 "   Stat" | lolcat
author
echo -e "\033[35m  [\e[1;37m+\033[35m]\e[1;32m EX- LK,US,UK,INDIA\n"
echo -n -e "\033[35m  [\e[1;37m+\033[35m]\033[1;35m Enter Your Country Name/Code : "
read cou
echo "\n"
source
echo "\n"
if [ "${userinput1:-}" = "1" ]
then
    curl https://corona-stats.online/$cou?source=1
elif [ "${userinput1:-}" = "2" ]
then
    curl https://corona-stats.online/$cou?source=2
elif [ "${userinput1:-}" = "" ]
then
    lk
else
    echo -e "\033[35m  [\e[1;37m!\033[35m]\e[1;31m Wrong Choice"
    sleep 2
    menu
fi
}

function number(){
clear
figlet -f smmono9 " Number-Based" | lolcat
figlet -f smmono9 "   Stat" | lolcat
author
echo -n -e "\033[35m  [\e[1;37m+\033[35m]\e[1;32m Enter the number to make the top list : "
read top
curl https://corona-stats.online?top=$top
}

function state(){
clear
figlet -f smmono9 " State-Based" | lolcat
figlet -f smmono9 "     Stat" | lolcat
author
echo -e "\033[35m  [\e[1;37m+\033[35m]\e[1;31m Still Support Only For Us\n"
source
if [ "${userinput1:-}" = "1" ]
then
    curl https://corona-stats.online/states/US?source=1
elif [ "${userinput1:-}" = "2" ]
then
    curl https://corona-stats.online/states/US?source=2
elif [ "${userinput1:-}" = "" ]
then
    lk
else
    echo -e  "\033[35m  [\e[1;37m1\033[35m]\e[1;31m Wrong Choice"
    sleep 2
    menu
fi
}

function graph(){
clear
figlet -f smmono9 " Graph-Based" | lolcat
figlet -f smmono9 "    Stat" | lolcat
author
echo -e "\033[35m  [\e[1;37m1\033[35m]\e[1;32m World"
echo -e "\033[35m  [\e[1;37m2\033[35m]\e[1;32m Country Based\n"
echo -e -n "\033[35m  [\e[1;37m+\033[35m]\e[1;31m Enter Choice : "
read userinput1
if [ "${userinput1:-}" = "1" ]
then
    curl https://corona-stats.online/graph
elif [ "${userinput1:-}" = "2" ]
then
    echo -n -e "\033[35m  [\e[1;37m+\033[35m]\e[1;33m Enter Your Country Code/Name : "
    read cou
    curl https://corona-stats.online/$cou/graph
else
    echo -e $re "\033[35m  [\e[1;37m/!\033[35m]\e[1;31m Wrong Choice"
    sleep 2
    menu
fi
}

function json(){
clear
figlet -f smmono9 "  As a .json" | lolcat
author
echo -e -n "\033[35m  [\e[1;37m+\033[35m]\e[1;32m Enter Your Country Code/Name : "
read cou
echo -e "\n\033[35m  [\e[1;37m+\033[35m]\033[1;35m Saving Data.json to a .txt File\n"
echo -n -e "\033[35m  [\e[1;37m+\033[35m]\e[1;31m Enter Output File Name : "
read out
curl https://corona-stats.online/$cou/?format=json > $out.txt
echo -e "\033[35m  [\e[1;37m+\033[35m]\e[1;33m Data Saved To $out.txt"
}

function html(){
clear
figlet -f smmono9 "  As a .html" | lolcat
author
echo -e -n "\033[35m  [\e[1;37m+\033[35m]\e[1;32m Enter Your Country Code/Name : "
read cou
echo -e "\n\033[35m  [\e[1;37m+\033[35m]\033[1;35m Saving Data to a .html File\n"
echo -n -e "\033[35m  [\e[1;37m+\033[35m]\e[1;31m Enter Output File Name : "
read out
wget -O $out.html https://corona-stats.online/$cou
echo -e "\033[35m  [\e[1;37m+\033[35m]\e[1;33m Data Saved To $out.html"
}

function advanced(){
clear
figlet -f smmono9 "ADVANCED MENU" | lolcat
author
echo -e "\033[35m  [\e[1;37m1\033[35m]\e[1;32m Advanced Help"
echo -e "\033[35m  [\e[1;37m2\033[35m]\e[1;33m Use Own Parameters"
echo -e "\033[35m  [\e[1;37m3\033[35m]\033[1;35m Latest Corona News"
echo -e "\033[35m  [\e[1;37m4\033[35m]\e[0;36m Data as a Graph"
echo -e "\033[35m  [\e[1;37m5\033[35m]\e[1;34m Data as a .json"
echo -e "\033[35m  [\e[1;37m6\033[35m]\e[1;33m Data as a .html"
echo -e "\033[35m  [\e[1;37m7\033[35m]\e[1;31m Back\n"
echo -n -e "\033[35m  [\e[1;37m+\033[35m]\e[1;37m Enter Choice : "
read userinput1
if [ "${userinput1:-}" = "1" ]
then
    clear
    figlet -f smmono9 "ADVANCED HELP" | lolcat
    author
    curl https://corona-stats.online/help
    back
elif [ "${userinput1:-}" = "2" ]
then
    echo -e "\033[35m  [\e[1;37m+\033[35m]\033[1;35m Add Own Parameters To Request \n"
    echo -n -e "Param > "
    read param
    curl https://corona-stats.online$param
    back
elif [ "${userinput1:-}" = "3" ]
then
    clear
    figlet -f smmono9 " Latet News" | lolcat
    author
    curl https://corona-stats.online/updates
    back
elif [ "${userinput1:-}" = "4" ]
then
    graph
    back
elif [ "${userinput1:-}" = "5" ]
then
    json
    back
elif [ "${userinput1:-}" = "6" ]
then
    html
    back
elif [ "${userinput1:-}" = "7" ]
then
    menu
elif [ "${userinput1:-}" = "" ]
then
    advanced
else
    echo -e "\033[35m  [\e[1;37m!\033[35m]\e[1;31m Wrong Choice"
    sleep 2
    advanced
fi
}

dependencies
chk
menu
