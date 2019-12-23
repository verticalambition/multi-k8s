docker build -t verticalambition/multi-client -f ./client/Dockerfile ./client
docker build -t verticalambition/multi-server -f ./server/Dockerfile ./server
docker build -t verticalambition/multi-worker -f ./worker/Dockerfile ./worker

docker push verticalambition/multi-client
docker push verticalambition/multi-server
docker push verticalambition/multi-worker

kubectl apply -f k8s

