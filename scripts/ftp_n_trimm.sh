#!/bin/bash
ftp_urls=$(curl "https://www.ebi.ac.uk/ena/data/warehouse/filereport?accession=${1}&result=read_run&fields=fastq_ftp" | sed -n 2p)

url_list=$(echo $ftp_urls | tr ";" "\n")

for addr in $url_list
do
    wget http://$addr -O
done
ls
which cutadapt
cutadapt -a AGATCGGAAGAGC -A AGATCGGAAGAGC -o ${2} -p ${3} -O 5 --minimum-length=50 ${1}_1.fastq.gz ${1}_2.fastq.gz

