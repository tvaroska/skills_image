#!/bin/bash
set -e

DEFAULT_TAG="v2.1.0"

# Get tag from command line or use default
REPO_TAG="${1:-$DEFAULT_TAG}"

# Clone the Skill_Seekers repository and checkout specified tag
if [ ! -d "Skill_Seekers" ]; then
    git clone https://github.com/yusufkaraaslan/Skill_Seekers.git
    cd Skill_Seekers
    git checkout "tags/$REPO_TAG"
    cd ..
else
    echo "Skill_Seekers directory already exists, checking out tag..."
    cd Skill_Seekers
    git fetch --tags
    git checkout "tags/$REPO_TAG"
    cd ..
fi

# Build Docker image
IMAGE_NAME="ghcr.io/tvaroska/skills_image"

# Remove leading 'v' if present
TAG="${REPO_TAG#v}"

echo "Building Docker image: ${IMAGE_NAME}:${TAG}"
docker build -t "${IMAGE_NAME}:${TAG}" .

# Push to GitHub Container Registry
echo "Pushing Docker image to GitHub Container Registry..."
docker push "${IMAGE_NAME}:${TAG}"

echo "Build and push completed successfully!"