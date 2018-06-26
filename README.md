#
# send_smsglobal_zabbix
#

On Zabbix you can send an alert through a SMS gateway. On this case, we'll be using SMSGLOBAL (www.smsglobal.com)

What you'll need:

1. Curl
2. SMS Global Master API Key
		2.1 You can get that here: https://mxt.smsglobal.com/integrations
3. Credits in your account

How to add the script to Zabbix (Tested on Zabbix Server 3.4):

1. Administration > Media Types
2. Add a new "Script" media Type
		2.1 Name: SMS Global - SMS
		2.2 Type: Script
		2.3 Script name: send_sms.sh
		2.4 Script parameters:
			2.4.1 PARAMETER 1: {ALERT.SENDTO}
			2.4.2 PARAMETER 2: {ALERT.MESSAGE}
3. Create an action and make sure it has the "SEND SMS" enabled on it.
4. Copy the script "send_sms.sh" to your Zabbix server on: /usr/lib/zabbix/alertscripts
5. Add permission to the file:
		5.1 chmod +x /usr/lib/zabbix/alertscripts/send_sms.sh
		5.2 chown zabbix:zabbix /usr/lib/zabbix/alertscripts/send_sms.sh

If you have any questions/improvements please, get in touch!
