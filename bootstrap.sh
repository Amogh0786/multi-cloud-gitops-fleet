#!/bin/bash
set -e

CLUSTER_NAME="gitops-control-plane"

echo "🚀 Starting Multi-Cloud GitOps Control Plane Bootstrap..."

# 1. Create kind cluster
if ! kind get clusters | grep -q "^${CLUSTER_NAME}$"; then
  echo "📦 Creating kind cluster: ${CLUSTER_NAME}..."
  kind create cluster --name "${CLUSTER_NAME}"
else
  echo "✅ kind cluster ${CLUSTER_NAME} already exists."
fi

# 2. Add Helm repos
echo "🔗 Adding Helm repositories..."
helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update

# 3. Install Crossplane
echo "⚙️ Installing Crossplane..."
helm upgrade --install crossplane crossplane-stable/crossplane \
  --namespace crossplane-system \
  --create-namespace \
  --wait

# 4. Install ArgoCD
echo "🐙 Installing ArgoCD..."
helm upgrade --install argocd argo/argo-cd \
  --namespace argocd \
  --create-namespace \
  --wait

echo "🎉 Bootstrap complete! Control plane is ready."
echo "➡️ Next steps:"
echo "1. Follow docs/secrets-setup.md to configure AWS and GCP credentials."
echo "2. Apply Crossplane Provider configs."
