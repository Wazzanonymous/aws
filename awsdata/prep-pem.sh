#!/bin/sh
# Author:			Chad Broadwater
# Version:			v1.0
# Date Modified:	2022-08-02
# Function:			Copy pem file and then set appropriate security for SSH
#				connection

#VARIABLES-------------------------------
FP="${HOME}/Desktop/awsdata/"
DLP="${HOME}/Download/"
#VARIABLES-------------------------------


echo "========================="

echo "Current Directory Path: "$FP
echo "Current Download Path:  "$DLP

read -p "Do you wish to delete the current *.pem and copy new ones from Downloads folder?: " CHOICE

if [ "$CHOICE" = "y" ] || [ "$CHOICE" = "Y" ]
then
	echo "Deleting local *.pem files."
	rm -vf ${FP}*.pem
	mv -vf ~/Downloads/*.pem $FP
fi


echo "Changing permissions for $FP*.pem files."

chmod -v 400 ${FP}*.pem

echo "Completed."

echo "========================="
