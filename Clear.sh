#!/bin/bash
. Config
	[ -n "$1" ] || { echo " $0 -- clear parameter error:no parameter";exit 136; }
		[ -d /root/git/shell/basic ] || bash initShPath.sh
		cd /root/git/shell/basic
		bash git_pull.sh shell || exit $?
			case "$1" in
				soft)bash clear_soft.sh || exit $?;;
				disk)bash clear_disk.sh || exit $?;;
				alldisk)bash clear_disk.sh all || exit $?;;	
				SN|CN|CLT_Master|CLT_Snode)bash clear_soft.sh $1 || exit $?;;			
				*)echo " $0 -- clear paremeter error";exit 137;;
			esac
