#/bin/bash
. Config
[ -f $stateFileName ] || bash Create.sh || exit $?
      [ -d /root/git/shell/basic ] || bash initShPath.sh || exit $?
        				cd /root/git/shell/basic
                bash git_pull.sh shell || exit $?
                bash softCheck.sh || exit $?
                jobs=`bash jobComparison.sh` || exit $?
                [ -n $jobs ] || { echo "no job" ; exit 0 ; }
                for job in $jobs
                        {
                                echo " $0 -- job is >>>> "$job "<<<<"
                                bash git_pull.sh $job || exit $?
                                bash configSoft.sh $job || exit $?
                                bash run.sh $job || exit $?
                        }
