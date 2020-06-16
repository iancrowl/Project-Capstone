#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="iancrowl/project-capstone"


# Step 2
# Run the Docker Hub container with kubernetes
kubectl set image deployments/project-capstone project-capstone=icrowl/project-capstone
#kubectl run project-capstone-app --image=$dockerpath --port=80


# Step 3:
# List kubernetes pods
kubectl get pods


# Step 4:
# Forward the container port to a host
kubectl apply -f deployment/deployment.yml

# Open the service 
# minikube service project-capstone-app