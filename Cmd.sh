#!/bin/bash
tmpFile=/tmp/tmpCMD.sh
[ -n "$1" ] || { echo " $0 -- cmd parameter error:no parameter";exit 131; }
		[ -d /root/git/shell/basic ] || bash initShPath.sh || exit $?
		cd /root/git/shell/basic
		bash git_pull.sh shell || exit $?
echo $1 > tmpFile || exit $?
	bash tmpFile || exit $?
		rm -fr tmpFile