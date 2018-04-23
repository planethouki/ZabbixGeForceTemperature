# ZabbixGeForceTemperature

ZabbixでGeForce GTXの温度とファン速度を監視するテンプレートです。

テストはCentOS7、Zabbix3.0で行ってます。

![Graph Image](https://github.com/planethouki/images/blob/master/zabbixGPUtemperatureGraph.PNG)

## server

Zabbix Serverの外部スクリプトで取得する場合のテンプレートです。

`server/gpu.sh`と`server/gpu-discovery.sh`を、外部スクリプトのディレクトリに配置してください。

外部スクリプトの配置場所は、
`/etc/zabbix/zabbix_server.conf`の`ExternalScripts`に書いてあります。

例：
`ExternalScripts=/usr/lib/zabbix/externalscripts`

その後、所有者を`zabbix`にし、実行権限を付与してください。
```
cd externalscripts
chown zabbix:zabbix *.sh
chmod +x *.sh
```

最後に、`Template_NVIDIA_SMI.xml`をZabbixにインポートしてください。
テンプレートをホストに適用すれば、ディスカバリによって自動的にアイテムが作成されます。

## agent

Zabbix Agentで取得する場合のテンプレートです。

`agent/gpu.sh`と`agent/gpu-discovery.sh`を、任意のディレクトリに配置してください。

例として`/opt/userparameterscripts`に配置したとします。

`/etc/zabbix/zabbix_agentd.conf`に、下記を追加してください。
```
UserParameter=gpu[*],/opt/userparameterscripts/gpu.sh $1 $2
UserParameter=gpu-discovery,/opt/userparameterscripts/gpu-discovery.sh
```

その後、zabbix agentを再起動してください。

最後に、`Template_NVIDIA_SMI_agent.xml`をZabbixにインポートしてください。
テンプレートをホストに適用すれば、ディスカバリによって自動的にアイテムが作成されます。
