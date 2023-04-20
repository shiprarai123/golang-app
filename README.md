# devops-techtask

## Overview

The Application can run on any cloud native/stand alone kubernetes Cluster and follows all the below requirements:

- Simple to build and run
- Application is able to be deployed on kubernetes and can be accessed from outside the cluster
- Application must be able to survive the failure of one or more instances while staying highly-available
- Redis must be password protected
- Readme documents how to run the code and provides explanation regarding the implementation

## 

The code is available here:
https://github.com/shiprarai123/golang-app.git

docker images are available here:
GO-APP: https://hub.docker.com/repository/docker/shipra999/golang-app/general
REDIS: https://hub.docker.com/repository/docker/shipra999/redis/general

run the shell script to bring up the app and redis services
```
sh deploy.sh
```
WARNING: This shell script is only to run innitally to setup the application using helm.


The helm chart cretes the following componenets:
- Go-app deployment with pod
- Go-app service
- Go-app replicaset
- Redis replicaset
- Redis secret
- Redis deployment with pod
- Redis service
- Horizontal pod autoscaler for Go-app
- Horizontal pod autoscaler for Redis

## Explaination

Docker images of both GO-app and Redis was built using ```docker build``` command and then pushed to dockerhub. A deployment was created for both redis and GO-app with a minimum of 2 pod availability attached with Horizontal pod autoscaler. This makes the application highly-available and can survive failure as the minimum count of available pods is always 2 if any pod goes down kubernets tries to bring up a new pod to always satisfy the codition of minimum 2 available pods at all times for each service. Redis is password protected and the Redis password is defined in secret.yaml which is base64 encoded. NodePort service is created for Go-app deployment to make it accessible outside the cluster and a ClusterIP service is created for Redis deployment to make it easily accessible by the application. Horizontal scaling is to responsed to increased load i.e to deploy more Pods. Making the application highly avaible.

- This is just an overview from kubernetes perspective and the whole end-to-end architecture is attached with the code. 
~                         
