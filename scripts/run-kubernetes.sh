#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="iancrowl/project-capstone-app"


# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deployment project-capstone-app --image=$dockerpath
#kubectl run project-capstone-app --image=$dockerpath --port=80


# Step 3:
# List kubernetes pods
kubectl get pods


# Step 4:
# Forward the container port to a host
kubectl expose deployment/project-capstone-app --port=80 --target-port=8000

# Open the service 
# minikube service project-capstone-app