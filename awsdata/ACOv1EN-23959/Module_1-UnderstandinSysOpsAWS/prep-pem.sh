#!/bin/sh
# Authoris: Wazza
# Version: v1.0
# Date  Modified: 2202-08-11
# Function: "Copy .pem file and then set appropriate security for SSH connection!"
#

FP="${HOME}/Desktop/awsData/"
DLP="${HOME}/Download/"

echo "========================"

echo "Logged inas User: "$USER

read -p "Do you wish to delete the current *.pem and copy new ones from Downloads folder?: " CHOICE

if [ "$CHOICE" = "y" ] || [ "$CHOICE" = "Y" ]
then
        echo "Deleting local *.pem files."
		rm -vf ${FP}*.pem
		mv -vf ~*.pem $FP
fi


echo "Changing permissions for $FP*.pem files."

chmod -v 400 ${FP}*.pem 

echo "Completed."

echo "========================"