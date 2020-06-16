#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build -t iancrowl/project-capstone-a .
#docker build -t iancrowl/project-capstone-b .

# Step 2: 
# List docker images
docker images

# Step 3: 
# Run app
docker run -p 8000:80 iancrowl/project-capstone-a
#docker run -p 8000:80 iancrowl/project-capstone-b