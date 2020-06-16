#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
##Image A
dockerpath="iancrowl/project-capstone:a"
##Image B
#dockerpath="iancrowl/project-capstone:b"


# Step 2:  
# Authenticate
echo "Docker ID and Image: $dockerpath"
docker login --username=iancrowl


# Step 3:
# Push image to a docker repository
docker push $dockerpath