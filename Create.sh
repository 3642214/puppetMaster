#/bin/bash
. Config
[ ! -f $stateFileName ] || { echo " $0 -- create error:state file Already exists";exit 130; }
        [ -d /root/git/shell/basic ] || bash initShPath.sh
        				cd /root/git/shell/basic
                bash git_pull.sh shell || exit $?
                jobs=`bash analyzeJob.sh $key` || exit $?
                for job in $jobs
                        {
                                echo " $0 -- job is >>>> "$job "<<<<"
                                bash git_pull.sh $job || exit $?
                                bash configSoft.sh $job || exit $?
                                bash run.sh $job || exit $?
                        }
