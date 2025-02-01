#Auto Temp Admin for Synology using the Acme-sh docker container


I use the following docker container [acme.sh Docker ](https://github.com/acmesh-official/acme.sh/wiki/Run-acme.sh-in-docker) 
and I wanted a way to securely run the hook cmd without setting a static admin account so i created a script, hopefully this helps some of you.

This script will do the following:

1. Generate a random username (e.g., 'tempadmin_XXXXXXXXXX') and store it in a variable
2. Generate a random password for the temporary admin user and store it in a variable
3. Create a user account with the random username & password on the Synology NAS
4. Add the temporary user to the 'administrators' group
5. Pass the username and password variables into the acme docker container and run the Synology hook script 
6. Delete the temporary admin user

Set Up:

If you use MFA on all admin accounts then change it to "specific users and groups" and select your static admin accounts

Create a scheduled task and run it as root and paste the script, don't forget to modify these (joe@bloggs.com $ example.com) for your environment!

Set the script to run every 65 day's or so (after the cert as been auto renewed)


