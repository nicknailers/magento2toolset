#!/bin/bash
## part of the magento2 toolset made by Nicolas Cloutier and available on github at
## https://github.com/nicknailers/m2toolset

read -rsp $'press any key to install cron jobs... or CTRL+C to exit \n' -n1 key;
echo "Magento2 default cronjobs which are requires, will be installed as running every 15 minutes. To change the settings please run 'crontab -e' at the prompt.";
echo '\n\n';

PHPBIN="/usr/bin/php"; #edit this path if your php binary is elsewhere, run whereis php to find the right path
MAGENTODIR=$(dirname "$(pwd)"); #this can be edited if you did put the script in another directory than ./tools
echo "Your php binary are installed at : ${PHPBIN}";
echo 'if you feel this is not the case please edit the PHPBIN path in this script.';
echo "Your magento directory is ${MAGENTODIR}";
echo '\n';


croncmd1="$PHPBIN $MAGENTODIR/bin/magento cron:run | grep -v 'Ran jobs by schedule' >> $MAGENTODIR/var/log/magento.cron.log";
croncmd2="$PHPBIN $MAGENTODIR/update/cron.php cron:run | grep -v 'Ran jobs by schedule' >> $MAGENTODIR/var/log/update.cron.log";
croncmd3="$PHPBIN $MAGENTODIR/bin/magento setup:cron:run | grep -v 'Ran jobs by schedule' >> $MAGENTODIR/var/log/setup.cron.log";


cronjob="* * * * * $croncmd1";
cronjob2="* * * * * $croncmd2";
cronjob3="* * * * * $croncmd3";

echo "$cronjob  ";
echo "$cronjob2  ";
echo "$cronjob3  ";

cat <(crontab -l) <(echo "$cronjob") | crontab -;
cat <(crontab -l) <(echo "$cronjob2") | crontab -;
cat <(crontab -l) <(echo "$cronjob3") | crontab -;
echo "All 3 cron jobs were installed.";
exit 0;
