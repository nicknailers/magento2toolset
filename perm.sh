#!/bin/bash
## part of the magento2 toolset made by Nicolas Cloutier and available on github at
## https://github.com/nicknailers/m2toolset

echo "setting files permissions to 644...";
find . -type f -exec chmod 0644 {} \;
echo "setting directories permissions to 755...";
find . -type d -exec chmod 0755 {} \;
echo "making public directories and caches writable by webserver..."
find "var" -type d -exec chown -R www-data.www-data {} \;
find "pub" -type d -exec chown -R www-data.www-data {} \;
find "var" -type d -exec chmod -R 0770 {} \;
find "pub" -type d -exec chmod -R 0770 {} \;
echo "permission settings done";

