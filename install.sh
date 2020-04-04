#!/bin/sh
bash /kubernetes-examples/deploy.sh
bash /kubernetes-examples/init.sh
echo "new token create"
kubeadm token create --print-join-command > /kubernetes-examples/token.sh
chmod 777 /kubernetes-examples/token.sh

cat workers | while read line
do
    if [ "$line" = "-" ]; then
        echo "Skip $line"
    else
        ssh root@$line -n "rm -rf /kubernetes-examples/ && mkdir /kubernetes-examples/"
        echo "Copy data to $line"
        scp  /kubernetes-examples/deploy.sh root@$line:/kubernetes-examples/ && scp /kubernetes-examples/token.sh root@$line:/kubernetes-examples/
        echo "Setup $line"
        ssh root@$line -n "cd /kubernetes-examples/ && sudo ./deploy.sh && sudo ./token.sh"
        echo "Finished config node $line"
    fi
done
