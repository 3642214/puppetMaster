#!/bin/bash
[ -f $stateFileName ] || { echo " $0 -- not found stateFile";exit 134; }
		[ -d /root/git/shell/basic ] || bash initShPath.sh || exit $?
		cd /root/git/shell/basic
		bash git_pull.sh shell || exit $?
		job=`bash readState.sh soft` || { echo " $0 -- readState error";exit 132; }
				if [ -z "$1" -o $1 = $job ]
					then
							echo " $0 -- Restart Soft ........."
							bash restartSoft.sh $job || exit $?
				elif [ $1 = "CN" -o $1 = "SN" -o $1 = "CLT_Master" -o $1 = "CLT_Snode" ]
					then
						exit 0				
				else
					echo " $0 -- paremeter error ,args:>> $1 << "
					exit 141
				fi