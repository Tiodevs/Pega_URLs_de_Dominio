#!/bin/bash
if [ "$1" == "" ]

#caso a pessoa nao coloque o dominio
then
	echo "Modo de uso: $0 DOMINIO"
	echo "Exemplo: $0 google.com"

#caso a pessoa coloque dominio
else
	#baixa o  HTML do dominio pelo wget
        echo $(wget -c $1 -O $1.txt)
	echo $(clear)

	#filtra o wget e manda para um arquivo .ip.txt
	grep href index.html | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v "<l" | grep -v ":" > $1.ip.txt

	#menu do user
	echo -e "━━╮╰╮┊┊┊┊┊┊
┊┊╰╮╰━▂▂▂▂┊┊┊┊┊┊
┊▂╱▔╲▔╱┏┳╮╲┊┊ᶤ.╭╮
▂╲▂▂╱╲╲╰┻┛╱▔▔▔▔┃
╲▂▂╱╭╯╱▔▔╱▔▔▔▽▽╯ _____
┊╱╱╭╯╱▔▔▔╲▂▂△▂△╮      |____   BY TIODEV VERSION 1.0
━━━╯╱╱╭━━━━━━━━╯"
	echo -e "\033[01;31m=======================================================================\033[01;31m";
	echo " "
	echo -e "\033[01;32m[+] Buscando Hosts da  URLs: $1\033[01;32m"
     	echo " "
	echo -e  "\033[01;31m=======================================================================\033[01;31m"
	echo " "
	echo -e "\033[01;32m[+] Concluindo: Salvando os resultados em $1.ip.txt\033[01;32m"
	echo -e "\033[01;31m=======================================================================\033[01;31m"
	echo -e "\033[01;32m[+]  ADDRESS     and     IP\033[01;32m"
	echo -e "\033[01;31m=======================================================================\033[01;31m"
	echo -e "\033[01;37m\033[01;37m"
#dando host (mostra ip) em todos os address do wget
for url in $(cat $1.ip.txt);
do
host $url
done
	echo -e  "\033[01;31m=======================================================================\033[01;31m"
fi

