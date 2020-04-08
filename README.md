# kubernetes-installer

### master shoud have at least 2 cpus.
### edit workers file
### ./install.sh install kubernetes in the cluster, then use `kubectl get nodes` check all nodes are ready 
### ./start.sh run hadoop,spark and hbase examples, then use `kubectl get pods` check all pods are running
### ./delete_pod.sh delete pods
### ./print_logs.sh print logs of three examples
### not use init.sh and deploy.sh, they are just helper scripts used in install.sh
