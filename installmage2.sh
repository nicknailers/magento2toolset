#!/bin/bash
## part of the magento2 toolset made by Nicolas Cloutier and available on github at
## https://github.com/nicknailers/m2toolset


echo 'please enter your info so we can install magento for you... \n';
read -rsp $'press any key to start... or CTRL+C to exit \n' -n1 key;

echo "Enter the url where Magento2 will be installed to :";
read BASEURL;
if [ -z "$BASEURL" ]
then
	echo "You need to enter a url! Cannot continue.";
exit 0;
fi

echo "Enter your DATABASE HOST (default:localhost) press enter for defaults :";
read DBHOST;
if [ -z "$DBHOST" ]
then
	DBHOST="localhost";
	echo "Localhost will be use by default";
fi

echo "Enter your DATABASE NAME (required) :";
read DBNAME;
if [ -z "$DBNAME" ]
then
	echo "You need to enter a database name! Cannot continue."; exit 0;
fi

echo "Enter your DATABASE username (required):";
read DBUSER;
if [ -z "$DBUSER" ]
then
	echo "You need to enter a username! Cannot continue."; exit 0;
fi

echo "Enter the password for your DATABASE (required):";
read DBPASS;
if [ -z "$DBPASS" ]
then
	echo "You need to enter a password! Cannot continue."; exit 0;
fi

echo "What is the Administrator first name for magento admin (required):";
read ADMINFIRSTNAME;
if [ -z "$ADMINFIRSTNAME" ]
then
	echo "You need to enter the admin first name! Cannot continue."; exit 0;
fi

echo "Enter the Administrator last name (required):";
read ADMINLASTNAME;
if [ -z "$ADMINLASTNAME" ]
then
	echo "You need to enter the admin last name! Cannot continue."; exit 0;
fi

echo "Enter the Administrator Email address (required) wrong format will make the installation fail.:";
read ADMINEMAIL;
if [ -z "$ADMINEMAIL" ]
then
	echo "You need to enter the admin email! Cannot continue"; exit 0;
fi

echo "Enter the password to login to the administrator area (required)  :";
read ADMINPASS;
if [ -z "$ADMINPASS" ]
then echo "You need to enter a password! Cannot continue"; exit 0;
fi

echo "Enter the main Language (locale) that you will use (ie.:default to en_US) press enter for default :";
read LANG;
if [ -z "$LANG" ]
then
	LANG="en_US"; echo "English USA will be used by default.";
fi


echo "Enter the Currency you will use (USD per default) press enter for default :";
read CURRENCY;
if [ -z "$CURRENCY" ]
then
	CURRENCY="USD";  echo "US Dollar will be your main currency.";
fi

echo "Enter the Timezone you are in format: America/New York (defaults to America/Chicago) press enter for default timezone :";
read TIMEZONE;
if [ -z "$TIMEZONE" ]
then
	TIMEZONE="America/Chicago";
	echo "America/Chicago (GMT -5) will be use by default.";
fi

read -rsp $'press any key to start the installation process... or 'CTRL+C' to exit \n' -n1 key;

../bin/magento setup:install --base-url=$BASEURL \
--db-host=$DBHOST --db-name=$DBNAME --db-user=$DBUSER --db-password=$DBPASS \
--admin-firstname=$ADMINFIRSTNAME --admin-lastname=$ADMINLASTNAME --admin-email=$ADMINEMAIL \
--admin-user=admin --admin-password=$ADMINPASS --language=$LANG --currency=$CURRENCY \
--timezone=$TIMEZONE --use-rewrites=1;

echo "Your installation was completed.";

exit 0;


