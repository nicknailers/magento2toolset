*** M2 Installation Toolset (C)2016 By Nicolas Cloutier (nicknailers@gmail.com)

Welcome to M2 Installation Toolset ! 

*** You need to have the compressed version of Magento for this to work. Uncompressed Magento2 
to the directory where you want your files in then follow the instructions below to use 
the M2 Installation Toolset.

*** Extract the content of the compressed file to {YOUR MAGENTO DIR}/tools

How to use it : 


Step 1 - Create a database by executing the file "createdb.sh" NOTE: Change the rootuser and rootpass in the script first.
Step 2 - Install magento by running the file "installmagento2.sh" and follow the wizard questions
Step 3 - When installed, make sure it was installed the right way by checking the provided admin
	url against your credentials.

Step 4 - Install Cron Jobs by running the "setcrons.sh" script file

NOTE ALL THE FILES ARE EDITABLE, FEEL FREE TO CONTRIBUTE!

** BONUS **

file: modules.sh (run this file to install a new module into magento will streamline the process)
file: perms.sh (run this file in your magento directory to reset all files permissions to the right ones)



