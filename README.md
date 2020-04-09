# kubernetes-installer

1. create two vms, one for manager and one for worker. The manager node should have at least two cpus.


2. At manager, make sure you can use ssh to connect to worker node (either external ip or internal ip)


3. go to root and git clone https://github.com/fishercht1995/kubernetes-examples.git


4. in the /kubernetes-examples/ folder, change workers (either internal or external ip)


5. ./install.sh for installing kubernetes in the cluster


6. `kubectl get nodes` to check whether all nodes are already


7. if all nodes are ready, `./start.sh` to start running three examples


8. you can check status of three pods by `kubectl get pods`


9. when all three pods are running or completed, print all logs by `./print_logs.sh`
