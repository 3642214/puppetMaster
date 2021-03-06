#!/bin/bash
[ -f $stateFileName ] || { echo " $0 -- not found stateFile";exit 134; }
	[ -n "$1" ] || { echo " $0 -- update parameter error:no parameter";exit 131; }
		[ -d /root/git/shell/basic ] || bash initShPath.sh || exit $?
		cd /root/git/shell/basic
		bash git_pull.sh shell || exit $?
		jobs=`bash readState.sh soft` || { echo " $0 -- readState error";exit 132; }
			for job in $jobs
				{
					if [ $1 = "soft" -a -z "$2" ]
						then
								echo " $0 -- Update Soft .... $job ....."
								bash git_pull.sh $job || exit $?
								bash update_soft.sh $job || exit $?
								bash run.sh $job || exit $?
					elif [ $1 = "soft" -a $2 = $job ]
						then
								echo " $0 -- Update Soft .... $job ....."
								bash git_pull.sh $job || exit $?
								bash update_soft.sh $job || exit $?
								bash run.sh $job || exit $?
					elif [ $1 = "config"  -a -z "$2" ]
						then
								echo " $0 -- Update Config .... $job ....."
								bash update_config.sh $job || exit $?
								bash run.sh $job || exit $?	
					elif [ $1 = "config"  -a $2 = $job ]
						then
								echo " $0 -- Update Config .... $job ....."
								bash update_config.sh $job || exit $?	
								bash run.sh $job || exit $?	
					fi
				}
			if [ -z "$2" -o "$2" = "CN" -o "$2" = "SN" -o "$2" = "CLT_Master" -o "$2" = "CLT_Snode" -o "$2" = "RTSP" -o "$2" = "SMTSDVR" ]
				then
					exit 0				
			else
				echo " $0 -- paremeter error ,args:>> $2 << "
				exit 133
			fi
			
