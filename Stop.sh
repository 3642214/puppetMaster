#!/bin/bash
[ -f $stateFileName ] || { echo " $0 -- not found stateFile";exit 134; }
		[ -d /root/git/shell/basic ] || bash initShPath.sh || exit $?
		cd /root/git/shell/basic
		bash git_pull.sh shell || exit $?
		jobs=`bash readState.sh soft` || { echo " $0 -- readState error";exit 132; }
			for job in $jobs
				{
					if [ -z "$1" -o "$1" = $job ]
						then
								echo " $0 -- Stop Soft ........."
								bash stopSoft.sh $job || exit $?
					fi
				}
			if [ -z "$1" -o "$1" = "CN" -o "$1" = "SN" -o "$1" = "CLT_Master" -o "$1" = "CLT_Snode" -o "$1" = "RTSP" ]
				then
					exit 0				
			else
				echo " $0 -- paremeter error ,args:>> $1 << "
				exit 141
			fi