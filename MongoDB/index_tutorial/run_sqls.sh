#!/bin/bash

if [ $# -ne 4 ]
then
    printf "\nUsage: \n\$ $0  <db>  <user> <password>  <file match>\n\n"
    exit 1
fi

db=$1
user=$2
pass=$3
fmatch=$4

flist=$(ls | egrep "$fmatch")

printf "\n##############################################\n-\n"
printf "Any errors will go into the file errors.log\n-\n"
d=$(date "+%d/%m/%Y")
printf "\nErrors when executed  \"$0\"  on  $d:\n\n" > errors.log

for f in $flist
do  
   printf "Executing $f...\n"
   mysql "$db" -u"$user" -p"$pass" -s -e "source $f" > /dev/null 2>> errors.log
done

printf "\n" >> errors.log
printf "\n##############################################\n\n"

