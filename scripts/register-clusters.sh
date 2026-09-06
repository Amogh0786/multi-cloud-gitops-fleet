#!/bin/bash
set -e

# NOTE: Before running this, ensure you have obtained the kubeconfig for both
# the EKS and GKE clusters provisioned by Crossplane and added them to your local kubeconfig.

EKS_CONTEXT="eks-admin@eks-cluster" # Replace with your actual EKS context
GKE_CONTEXT="gke_project_zone_cluster" # Replace with your actual GKE context

echo "🔗 Registering AWS EKS Cluster with ArgoCD..."
argocd cluster add ${EKS_CONTEXT} --name eks-cluster --label provider=AWS --yes

echo "🔗 Registering GCP GKE Cluster with ArgoCD..."
argocd cluster add ${GKE_CONTEXT} --name gke-cluster --label provider=GCP --yes

echo "✅ Clusters registered with ArgoCD!"
