#Auto Temp Admin for Synology using the Acme-sh docker container

I use the following docker container acme.sh Docker and I wanted a way to securely run the hook cmd without setting a static admin account so i created a script, hopefully this helps some of you.

This script will do the following:

Generate a random username (e.g., 'tempadmin_XXXXXXXXXX') and store it in a variable
Generate a random password for the temporary admin user and store it in a variable
Create a user account with the random username & password on the Synology NAS
Add the temporary user to the 'administrators' group
Pass the username and password variables into the acme docker container and run the Synology hook script
Delete the temporary admin user
Set Up:

If you use MFA on all admin accounts then change it to "specific users and groups" and select your static admin accounts

Create a scheduled task and run it as root and paste the script, don't forget to modify these (joe@bloggs.com & example.com) for your environment!

Set the script to run every 65 day's or so (after the cert as been auto renewed)
