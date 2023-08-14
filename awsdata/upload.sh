#!/bin/sh
# Author:			Chad Broadwater
# Version:			v1.0
# Date Modified:	2022-08-24
# Function:			Upload a file/folder to EC2 Instance

FP="${HOME}/Desktop/awsdata/"
FLD_CLI=$FP"uploads/"
FLD_SVR="/home/ec2-user/"

echo "========================="

echo "Logged in as User: "$USER

echo "Upload file/folder to EC2 Instance..."

read -p "What is your .PEM file name [labsuser.pem]: " IPPEM

if [ "$IPPEM" = "" ]
then
	echo "Using default file labsuser.pem"
	IPPEM="labsuser.pem"
fi


if [ -f "$FP$IPPEM" ]
then
	echo "Upload EC2 Server"
	read -p "What is your EC2 IP address: " IPADD



	echo "Attempting to upload file/folder via SCP using IP Address: " $IPADD
	echo "From Client Folder Location: $FLD_CLI"
	echo "To   Server Folder Location: $FLD_SVR"

	scp -ri $FP$IPPEM $FLD_CLI  ec2-user@$IPADD:$FLD_SVR
else
	echo "File $IPPEM does not exist."
	echo "Please select a file that exists when using this script."
fi

echo "========================="
