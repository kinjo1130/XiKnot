#!/bin/bash
set -e

# Configuration
SERVICE_NAME="company-page"
REPOSITORY="company-page"

# Default values
PROJECT_ID="${1:-niftyshift}"
REGION="${2:-asia-northeast1}"

IMAGE_URL="${REGION}-docker.pkg.dev/${PROJECT_ID}/${REPOSITORY}/${SERVICE_NAME}"

echo "=== Cloud Run Deployment ==="
echo "Project: ${PROJECT_ID}"
echo "Region: ${REGION}"
echo "Service: ${SERVICE_NAME}"
echo "Image: ${IMAGE_URL}"
echo ""

# Create Artifact Registry repository if not exists
echo "Creating Artifact Registry repository (if not exists)..."
gcloud artifacts repositories create "${REPOSITORY}" \
  --repository-format=docker \
  --location="${REGION}" \
  --project="${PROJECT_ID}" \
  2>/dev/null || echo "Repository already exists"

# Configure Docker authentication
echo "Configuring Docker authentication..."
gcloud auth configure-docker "${REGION}-docker.pkg.dev" --quiet

# Build Docker image
echo "Building Docker image..."
docker build -t "${IMAGE_URL}:latest" .

# Push to Artifact Registry
echo "Pushing image to Artifact Registry..."
docker push "${IMAGE_URL}:latest"

# Deploy to Cloud Run
echo "Deploying to Cloud Run..."
gcloud run deploy "${SERVICE_NAME}" \
  --image "${IMAGE_URL}:latest" \
  --region "${REGION}" \
  --project "${PROJECT_ID}" \
  --platform managed \
  --allow-unauthenticated \
  --memory 256Mi \
  --min-instances 0 \
  --max-instances 10 \
  --concurrency 80

echo ""
echo "=== Deployment Complete ==="
gcloud run services describe "${SERVICE_NAME}" \
  --region "${REGION}" \
  --project "${PROJECT_ID}" \
  --format "value(status.url)"
