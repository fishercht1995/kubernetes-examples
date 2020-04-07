echo "hadoop pod initialize"
kubectl apply -f ./examples/hadoop.yaml

echo "spark pod initialize"
kubectl apply -f ./examples/spark.yaml

echo "hbase pod initialize"
mkdir -p ~/data/hbase
kubectl apply -f ./examples/hbase.yaml
