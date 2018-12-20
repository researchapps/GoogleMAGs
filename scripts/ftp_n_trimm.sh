#!/bin/bash
ftp_urls=$(curl "https://www.ebi.ac.uk/ena/data/warehouse/filereport?accession=${1}&result=read_run&fields=fastq_ftp" -s | sed -n 2p)

url_list=$(echo $ftp_urls | tr ";" "\n")

for addr in $url_list
do
	wget  $addr
done
set -x
mkdir trimmed
cutadapt -a AGATCGGAAGAGC -A AGATCGGAAGAGC -o trimmed/${1}_1.t.fastq.gz -p trimmed/${1}_1.t.fastq.gz -O 5 --minimum-length=50 ${1}_1.fastq.gz ${1}_2.fastq.gz

