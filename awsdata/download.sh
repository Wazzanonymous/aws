#!/bin/sh
# Author:			Chad Broadwater
# Version:			v1.0
# Date Modified:	2022-08-24
# Function:			Upload a file/folder to EC2 Instance

FP="${HOME}/Desktop/awsdata/"
FLD_CLI=$FP
FLD_SVR="/home/ec2-user/uploads/"

echo "========================="

echo "Logged in as User: "$USER

echo "Download file/folder from EC2 Instance..."

read -p "What is your .PEM file name [labsuser.pem]: " IPPEM

if [ "$IPPEM" = "" ]
then
	echo "Using default file labsuser.pem"
	IPPEM="labsuser.pem"
fi


if [ -f "$FP$IPPEM" ]
then
	echo "Download from EC2 Server"
	read -p "What is your EC2 IP address: " IPADD



	echo "Attempting to download file/folder via SCP from IP Address: " $IPADD

	echo "From Server Folder Location: $FLD_SVR"
	echo "To   Client Folder Location: $FLD_CLI"


	scp -ri $FP$IPPEM ec2-user@$IPADD:$FLD_SVR $FLD_CLI
else
	echo "File $IPPEM does not exist."
	echo "Please select a file that exists when using this script."
fi

echo "========================="
