## NOTE: Commented out commands have been made obsolete by our Docker compose, but they're still good informational references

## Remove any existing/running docker 'backend-app' containers/images
#docker stop backend-app
#docker rm backend-app
#docker rmi backend-app

## Create our backend jar
gradle bootJar

## Create the build directory structure
mkdir -p ./build/dependency && (cd ./build/dependency; jar -xf ../libs/*.jar)

## Build our docker application image
#docker build -t backend-app .

## Create a new container containing our application image
#docker create -p 8080:8080 --name backend-app backend-app
