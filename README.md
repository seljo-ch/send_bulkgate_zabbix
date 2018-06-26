#
# send_smsglobal_zabbix
#

On Zabbix you can send an alert through a SMS gateway. On this case, we'll be using SMSGLOBAL (www.smsglobal.com)

What you'll need:

1. Curl
2. SMS Global Master API Key
		You can get that here: https://mxt.smsglobal.com/integrations
3. Credits in your account

How to add the script to Zabbix (Tested on Zabbix Server 3.4):

1. Administration > Media Types
2. Add a new "Script" media Type
```
		Name: SMS Global - SMS
		Type: Script
		Script name: send_sms.sh
		Script parameters:
		PARAMETER 1: {ALERT.SENDTO}
		PARAMETER 2: {ALERT.MESSAGE}
```

3. Create an action and make sure it has the "SEND SMS" enabled on it.
4. Copy the script "send_sms.sh" to your Zabbix server on: /usr/lib/zabbix/alertscripts
5. Add permission to the file:
```
		chmod +x /usr/lib/zabbix/alertscripts/send_sms.sh
		chown zabbix:zabbix /usr/lib/zabbix/alertscripts/send_sms.sh
```

If you have any questions/improvements please, get in touch!
