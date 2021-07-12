#!/bin/bash
for domain in $(cat $1)
do
echo "$domain" | qsreplace "$2" | xargs -P30 -n1 curl -s -k -L | grep "sql" &>/dev/null && echo -e " \033[0;31m[!]VULNERABLE \033[0;96mURL---> \033[0;35m$domain" || echo -e "\033[0;98mNOT VLUN \033[0;93mURL \033[0;97m$domain" | tee result

done 