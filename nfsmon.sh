#!/bin/bash
#========================================
# Author: Anton Kosenko
# E.mail: Anton.Kosenko@gmail.com
# Description: NFS server monitor
# Version 0.1
# Licensed under the Apache License, Version 2.0
#========================================
# Parametrs
# nfsmon <metric>
#========================================
# Metrics
# Replay Cache:
# hits			client did not receive a reply and decided to re-transmit its request and the reply was cached
# misses 		an operation that requires caching
#
# File Handles:
# stale			a file handle references a location that has been recycled
#
# IO:
# read			total amount of bytes read from disk
# write			total amount of bytes written to disk
#
# RPC:
# badcalls 		total number of calls rejected by the RPC layer
# badfmt		most bad calls
# tcpconn		count every TCP connection
#
# Operations:
# getattr		get file attributes (%)
# 
#=======================================
CMD='/usr/sbin/nfsstat -o all'

NFS_MT=$1

case ${NFS_MT} in
	hits)
	result=`$CMD | grep -A 1 'hits' | tail -1 | awk -F' ' '{print $1}'`
 	echo ${result}
	;;
	misses)
	result=`$CMD | grep -A 1 'misses' | tail -1 | awk -F' ' '{print $2}' `
	echo ${result}
	;;
	stale)
	result=`$CMD | grep -A 1 'stale' | tail -1 | awk -F' ' '{print $5}'`
	echo ${result}
	;;
	read)
	result=`$CMD | grep -A 2 'io stats' | tail -1 | awk -F' ' '{print $1}'`
	echo ${result}
	;;
	write)
	result=`$CMD | grep -A 2 'io stats' | tail -1 | awk -F' ' '{print $2}'`
	echo ${result}
	;;
	badcalls)
	result=`$CMD |	grep -A 1 'badcalls' | tail -1 | awk -F' ' '{print $2}'`
	echo ${result}	
	;;
	badfmt)
	result=`$CMD | grep -A 1 'badfmt' | tail -1 | awk -F' ' '{print $3}'`
	echo ${result}
	;;
	tcpconn)
	result=`$CMD | grep -A 1 'tcpconn' | tail -1 | awk -F' ' '{print $4}'`
	echo ${result}
	;;
	read_op)
	result=`$CMD | grep -A 1 'readdir' | tail -1 | awk -F' ' '{print $2}' | cut -d '%' -f 1`
	echo ${result}
	;;
	write_op)
	result=`$CMD | grep -A 1 'rellockowner' | tail -1 | awk -F' ' '{print $8}' | cut -d '%' -f 1`
	echo ${result}
	;;
	getattr_op)
	result=`$CMD | grep -A 1 'getattr' | tail -1 | awk -F' ' '{print $10}' | cut -d '%' -f 1`
	echo ${result}
	;;
esac
