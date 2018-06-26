#!/bin/sh
#
# Script to send SMS alerts via Zabbix
#
# More information about the SMS Global HTTP API: https://www.smsglobal.com/http-api/
#
# Sending the output to a file. I am getting that file's data into Zabbix.
# These lines are optional.
#
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>/var/run/zabbix/log/log.out 2>&1

# Your SMSGLOBAL credentials here
USERNAME=lucastest
PASSWORD=abc123
PHONE=${1}
MESSAGE=${2}

# This echo is only for my /var/run/zabbix/log/log.out script
echo "date +%H:%M:%: Sending SMS Text to $1"

#
# Posting the SMS via HTTP API
# 
# NOTE: Because the Zabbix alerts have spaces/new lines, we are using the "--data-urlencode" option to encode the message.
#
curl -X POST "https://api.smsglobal.com/http-api.php?action=sendsms&user=$USERNAME&password=$PASSWORD&from=Test&to=$PHONE" --data-urlencode text="$MESSAGE"

echo "date +%H:%M:%: SMS Text sent to $1"
echo "MESSAGE: $2"
