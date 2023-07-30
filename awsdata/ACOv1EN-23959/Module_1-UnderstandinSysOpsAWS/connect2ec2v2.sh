#!/bin/sh
# Author:			Chad Broadwater
# Version:			v1.0
# Date Modified:	2022-08-02
# Function:			Connect to our EC2 Instance using SSH
#					Using IP address given.

FP="${HOME}/Desktop/awsdata/"

echo "========================="

echo "Logged in as User: "$USER

echo "Checking for connection requirements..."

read -p "What is your .PEM file name [labsuser.pem]: " IPPEM

if [ "$IPPEM" = "" ]
then
	echo "Using default file labsuser.pem"
	IPPEM="labsuser.pem"
fi


if [ -f "$FP$IPPEM" ]
then
	echo "Connect to an EC2 instance."
	read -p "What is your EC2 IP address: " IPADD
	
	echo "Attempting to connect via SSH using IP Address: " $IPADD
	ssh -i $FP$IPPEM ec2-user@$IPADD
else
	echo "File $IPPEM does not exist."
	echo "Please select a file that exists when using this script."
fi

echo "========================="
