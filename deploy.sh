docker build -t verticalambition/multi-client:latest -t verticalambition/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t verticalambition/multi-server:latest -t verticalambition/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t verticalambition/multi-worker:latest -t verticalambition/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push verticalambition/multi-client:latest
docker push verticalambition/multi-server:latest
docker push verticalambition/multi-worker:latest

docker push verticalambition/multi-client:$SHA
docker push verticalambition/multi-server:$SHA
docker push verticalambition/multi-worker:$SHA


kubectl apply -f k8s
kubectl set image deployments/server-deployment server=verticalambition/multi-server:$SHA
kubectl set image deployments/client-deployment client=verticalambition/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=verticalambition/multi-worker:$SHA


