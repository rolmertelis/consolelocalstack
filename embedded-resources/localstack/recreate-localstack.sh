#!/bin/sh

echo -e "***** shutting down previous container for localstack ***"
CONTAINER_NAME=localstack1 docker-compose down
echo -e "***** removing previous container for localstack ***"
CONTAINER_NAME=localstack1 docker-compose rm
echo -e "***** running container for localstack from compose file ***"
CONTAINER_NAME=localstack1 docker-compose up

