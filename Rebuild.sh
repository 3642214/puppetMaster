#!/bin/bash
[ -n "$1" ] || { echo " $0 -- update parameter error:no parameter";exit 135; }
bash Clear.sh $1 || exit $?
bash Create.sh || exit $?
