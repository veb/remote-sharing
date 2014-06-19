 #!/bin/bash

#
# @Author: Mike Mackenzie
# @Usage: [start] [stop]
#
# Using this basic script you can remotely login to your OS X system using a
# VNC client (like Chicken of the VNC). This script goes on the idea that
# you're not in the location of the computer you wish to remotely connect to
# (like your work computer). Make sure you stop the service after use. 

PASSWORD=`openssl rand -base64 6`

if [ "$1" == 'start' ]
then
    sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -configure -access -on -clientopts -setvnclegacy -vnclegacy yes -clientopts -setvncpw -vncpw $PASSWORD -restart -agent -privs -all > /dev/null

    echo "Remote sharing started. Use any VNC client to access this server."
    echo "Your VNC password is: {$PASSWORD}"

elif [ "$1" == 'stop' ]
then
    sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -deactivate -configure -access -off > /dev/null
        
    echo "Remote sharing stopped."
else
    echo "Usage: start stop"
    exit
fi
