#!/bin/bash

# Check if all required arguments are provided
if [ $# -ne 2 ]; then
  echo "Usage: $0 <GitHub Repository> <Docker Hub Repository>"
  exit 1
fi

# Extract GitHub repository details
github_repo=$1
repo_name=$(basename $github_repo)

# Clone the GitHub repository
git clone https://github.com/$github_repo
if [ $? -ne 0 ]; then
  echo "Failed to clone GitHub repository: $github_repo"
  exit 1
fi

# Change to the cloned repository directory
cd $repo_name

# Build the Docker image using the Dockerfile in the repository root
docker build -t $repo_name .

# Check if the Docker image build was successful
if [ $? -ne 0 ]; then
  echo "Failed to build Docker image for repository: $repo_name"
  exit 1
fi

# Tag the Docker image with the provided Docker Hub repository
docker tag $repo_name $2:latest

# Push the Docker image to Docker Hub
docker push $2

# Check if Docker push was successful
if [ $? -ne 0 ]; then
  echo "Failed to push Docker image to repository: $2"
  exit 1
fi

echo "Docker image for repository $repo_name has been built and published to $2"
