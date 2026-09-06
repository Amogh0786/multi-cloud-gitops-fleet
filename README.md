# Multi-Cloud GitOps Fleet Management 🚢☁️

![Architecture](https://img.shields.io/badge/Architecture-Multi--Cloud-blue)
![GitOps](https://img.shields.io/badge/GitOps-ArgoCD-orange)
![Infrastructure](https://img.shields.io/badge/IaC-Crossplane-purple)

An enterprise-grade GitOps control plane that provisions, manages, and deploys to Kubernetes clusters across AWS (EKS) and GCP (GKE) entirely through Git-versioned declarative manifests.

## 🌟 Key Features
- **Multi-Cloud Provisioning:** Uses Crossplane to dynamically provision EKS and GKE clusters.
- **Infrastructure Abstraction:** Leverages Crossplane Composite Resource Definitions (XRDs) to provide a unified `FleetCluster` API for developers.
- **GitOps Synchronization:** ArgoCD continuously monitors this repository and synchronizes state across the entire fleet of clusters.
- **Progressive Delivery:** Argo Rollouts enables advanced deployment strategies like Canary and Blue/Green.
- **Policy-as-Code:** Kyverno enforces security policies (e.g., required labels, no root containers) at the cluster level.
- **Observability:** Centralized monitoring with the `kube-prometheus-stack`.
- **Secret Management:** External Secrets Operator integration for fetching credentials securely from HashiCorp Vault.

## 📂 Repository Structure
- `apps/`: Source code for the demo Go microservice and its Helm chart.
- `gitops/`: ArgoCD `AppProject`, `ApplicationSet`, and enterprise add-ons (Kyverno, Observability, etc.).
- `infra/`: Crossplane manifests, Custom Compositions, and Cloud Provider configurations.
- `docs/`: Additional documentation and setup guides.
- `.github/workflows/`: CI pipelines for building, testing, and linting.

## 🚀 Getting Started
1. Run `./bootstrap.sh` to create the local `kind` control plane.
2. Inject your AWS/GCP credentials (see `docs/secrets-setup.md`).
3. Apply the Crossplane providers and fleet compositions in `infra/`.
4. Apply the ArgoCD ApplicationSet in `gitops/` to sync the fleet!
