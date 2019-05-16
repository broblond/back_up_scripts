#!/bin/bash

HOME_DIR='/path/to/backup'
CURRENT_DATE=`date +%Y%m%d`
DATE=($CURRENT_DATE -d '-7 hour')             #i make b-ups at 3pm
TODAY_DIR=($HOME_DIR/$DATE) 
NUMBER_BACKUPED_FILES=`ls -l $TODAY_DIR | grep "^-" | wc | awk '{print $1}'`    #number of files

no_files=()   #array for not found files 


files=(names of files f this array )

for i in ${!files[@]}
do 
	listed=`find $TODAY_DIR | grep ${files[i]} -c`
	if [ $listed = 0 ]; 
	then
		no_files+=( ${files[i]} )
	fi
done

if [[ ${#no_files[@]} -ne 0 ]];
then 
	echo "CRITICAL ${no_files[@]}  NOT FOUND"
	exit 2 
else 
echo 'OKEY ALL FILES FOUND'
exit 0
fi

if [ $NUMBER_BACKUPED_FILES -gt  ${#files[@]} ];
then  
	echo "WARNING MORE FILES" 
	exit 1
fi 

