# ZabbixGeForceTemperature

ZabbixでGeForce GTXの温度とファン速度を監視するテンプレートです。

## server

Zabbix Serverの外部スクリプトで取得する場合のテンプレートです

/etc/zabbix/zabbix_server.conf
ExternalScripts=/usr/lib/zabbix/externalscripts

## agent

Zabbix Agentで取得する場合のテンプレートです

/etc/zabbix/zabbix_agentd.conf

UserParameter=gpu[*],/opt/userparameterscripts/gpu.sh $1 $2
UserParameter=gpu-discovery,/opt/userparameterscripts/gpu-discovery.sh
