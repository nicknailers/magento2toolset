#!/bin/bash
## part of the magento2 toolset made by Nicolas Cloutier and available on github at
## https://github.com/nicknailers/m2toolset

MAGENTODIR=$(dirname "$(pwd)");
chmod 0755 $MAGENTODIR/bin/magento;
echo "Please enter the module name you want to enable";
read MODULE_NAME;
if [ -z "$MODULE_NAME" ];
then
	echo "You did not give any module name to enable";
exit 0;
fi

echo "Upgrading database structure and data...";
$MAGENTODIR/bin/magento setup:upgrade;
echo "Enabling module...";
$MAGENTODIR/bin/magento module:enable $MODULE_NAME;
#rm -rf $MAGENTODIR/var/*;
#rm -rf $MAGENTODIR/pub/*;
echo "recompiling dependencies...";
$MAGENTODIR/bin/magento setup:di:compile;
echo "clearing cache...";
$MAGENTODIR/bin/magento cache:flush;


echo "We will reset your files permissions to avoid 500 errors, please standby...";

echo "setting files permissions to 644...";
find "$MAGENTODIR/." -type f -exec chmod 0644 {} \;
echo "setting directories permissions to 755...";
find "$MAGENTODIR/." -type d -exec chmod 0755 {} \;
echo "making public directories and caches writable by webserver..."
find "$MAGENTODIR/var" -type d -exec chown -R www-data.www-data {} \;
find "$MAGENTODIR/pub" -type d -exec chown -R www-data.www-data {} \;
find "$MAGENTODIR/var" -type d -exec chmod -R 0777 {} \;
find "$MAGENTODIR/pub" -type d -exec chmod -R 0777 {} \;
echo "permission settings done";

