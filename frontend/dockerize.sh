docker stop rtoombs
docker rm rtoombs
docker rmi frontend
docker build -t frontend .
docker run -d --name rtoombs -p 9000:80 frontend