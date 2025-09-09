#!/usr/bin/bash -l 

GSE_ID=GSE294122
GSE_subdir="${GSE_ID%???}nnn" # Remove last 3 digits, then add "nnn"

raw_file_name="${GSE_ID}_RAW.tar"
raw_file_url="ftp://ftp.ncbi.nlm.nih.gov/geo/series/${GSE_subdir}/$GSE_ID/suppl/$raw_file_name"

wget -O $raw_file_name "$raw_file_url"

# Extract archive file
tar xvf $raw_file_name

# Make one directory per sample
mkdir Old_Females Old_Males Young_Females Young_Males

# rename each file and place it in its corresponding directory
mv {GSM8898973_Old_Females_,Old_Females/}barcodes.tsv.gz
mv {GSM8898973_Old_Females_,Old_Females/}features.tsv.gz
mv {GSM8898973_Old_Females_,Old_Females/}matrix.mtx.gz
mv {GSM8898971_Old_Males_,Old_Males/}barcodes.tsv.gz
mv {GSM8898971_Old_Males_,Old_Males/}features.tsv.gz
mv {GSM8898971_Old_Males_,Old_Males/}matrix.mtx.gz
mv {GSM8898972_Young_Females_,Young_Females/}barcodes.tsv.gz
mv {GSM8898972_Young_Females_,Young_Females/}features.tsv.gz
mv {GSM8898972_Young_Females_,Young_Females/}matrix.mtx.gz
mv {GSM8898970_Young_Males_,Young_Males/}barcodes.tsv.gz
mv {GSM8898970_Young_Males_,Young_Males/}features.tsv.gz
mv {GSM8898970_Young_Males_,Young_Males/}matrix.mtx.gz
