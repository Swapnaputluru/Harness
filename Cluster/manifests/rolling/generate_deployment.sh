#!/bin/bash

# Check if the image tag argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <image_tag>"
    exit 1
fi

IMAGE_TAG=$1
OUTPUT_FILE="deployment.yaml"

# Generate the deployment YAML file
cat <<EOF > $OUTPUT_FILE
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-blue
  labels:
    app: nginx
    version: blue
    harness.io/color: blue  # Added this label
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nginx
      version: blue
      harness.io/color: blue  # Ensure selector matches labels in template
  template:
    metadata:
      labels:
        app: nginx
        version: blue
        harness.io/color: blue  # Added this label
    spec:
      containers:
      - name: nginx
        image: 19980617/python:$IMAGE_TAG
        ports:
        - containerPort: 80
EOF

echo "File $OUTPUT_FILE generated successfully with image tag $IMAGE_TAG"

# Stage, commit, and push changes
git add $OUTPUT_FILE
git commit -m "Updated deployment.yaml with image tag $IMAGE_TAG"

# Ensure the remote is set correctly
git remote -v

# Push changes
git push origin main
