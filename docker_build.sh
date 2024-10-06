#!/bin/bash

# genera l'immagine

image_name=whisper-amdgpu

# kill all previous containers
docker ps --all | grep "$image_name" | awk '{print $1}' | xargs docker rm 2>/dev/null

# remove previous images
docker rmi "$image_name"

# rebuild the image
docker build -t "$image_name" .

