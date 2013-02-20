. Config
echo " $0 -- not found shell path,create it!"
mkdir -p /root/git && cd /root/git && git clone $GitServer:/root/git_work/shell || { echo " $0 -- create shell path error";exit 138;}