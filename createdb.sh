#!/bin/bash
## part of the magento2 toolset made by Nicolas Cloutier and available on github at
## https://github.com/nicknailers/m2toolset


ROOTNAME="";
ROOTPASS="";
HOST="localhost";
PORT="3306";
echo "Please enter the database name you want to create:";
read DATABASENAME;
if [ -z "$DATABASENAME" ] 
then
	echo "Error no database name specified";
exit 0;
fi;

echo "Enter username that will have access to that database:";
read USERNAME;
echo "Pick a password for that user:";
read PASSWORD;

echo "Creating database $DATABASENAME please wait";
mysql --user $ROOTNAME -p$ROOTPASS --host $HOST -e "CREATE DATABASE ${DATABASENAME};GRANT ALL ON $DATABASENAME.* TO '$USERNAME'@'localhost' IDENTIFIED BY '$PASSWORD'; FLUSH PRIVILEGES;";
echo "DATABASE created successfully."
exit 0;
 

