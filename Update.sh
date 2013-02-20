#!/bin/bash
[ -f $stateFileName ] || { echo " $0 -- not found stateFile";exit 134; }
	[ -n "$1" ] || { echo " $0 -- update parameter error:no parameter";exit 131; }
		[ -d /root/git/shell/basic ] || bash initShPath.sh || exit $?
		cd /root/git/shell/basic
		bash git_pull.sh shell || exit $?
		job=`bash readState.sh soft` || { echo " $0 -- readState error";exit 132; }
				if [ $1 = "soft" ]
					then
						echo " $0 -- Update Soft ........."
						bash git_pull.sh $job || exit $?
						bash update_soft.sh $job || exit $?
				elif [ $1 = "config" ]
					then
						echo " $0 -- Update Config ......."
						bash update_config.sh $job || exit $?
				else
					echo " $0 -- paremeter was not soft or config"
					exit 133
				fi
			bash run.sh $job || exit $?
