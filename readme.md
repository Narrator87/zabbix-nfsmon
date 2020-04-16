# Zabbix Template for NFS server monitor

> Version 0.1 - (20200414)

for Zabbix 4.x (Zabbix later was not tested)

Must be installed on host:
**zabbix-agent & nfs-common**

## Install

* mkdir directory /etc/zabbix/bin
* copy nfsmon.sh into /etc/zabbix/bin
* copy userparameter_nfsmon.conf into /etc/zabbix/zabbix_agent.d
* import Template
* restart zabbix_agent

## Files

* nfsmon.sh - collect metrics
* zbx_export_nfsmon_templates.xml - Zabbix template
* userparameter_nfsmon.conf - Zabbix userparameters file
