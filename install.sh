#!/bin/sh
./deploy.sh
./init.sh
echo "new token create"
kubeadm token create --print-join-command > token.sh

cat workers | while read line
do
    if [ "$line" = "-" ]; then
        echo "Skip $line"
    else
        ssh root@$line -n "rm -rf /kubernetes-install/ && mkdir /kubernetes-installer/"
        echo "Copy data to $line"
        scp  /mapreduce-test/setup.py root@$line:/mapreduce-test/ && scp /mapreduce-test/manager root@$line:/mapreduce-test/ && scp /mapreduce-test/workers root@$line:/mapreduce-test/
        echo "Setup $line"
        ssh root@$line -n "cd /mapreduce-test/ && python3 setup.py && ntpdate time.nist.gov"
        echo "Finished config node $line"
    fi
done
