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
				elif [ $1 = $job ]
					then
						echo " $0 -- Update $1 ........."
						bash git_pull.sh $job || exit $?
						bash update_soft.sh $job || exit $?		
				elif [ $1 = "CN" -o $1 = "SN" -o $1 = "CLT_Master" -o $1 = "CLT_Snode" ]
					then
						exit 0				
				else
					echo " $0 -- paremeter error ,args:>> $1 << "
					exit 133
				fi
			bash run.sh $job || exit $?
