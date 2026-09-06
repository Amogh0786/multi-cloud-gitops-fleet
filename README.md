# Multi-Cloud GitOps Fleet Management 🚢☁️

![Architecture](https://img.shields.io/badge/Architecture-Multi--Cloud-blue)
![GitOps](https://img.shields.io/badge/GitOps-ArgoCD-orange)
![Infrastructure](https://img.shields.io/badge/IaC-Crossplane-purple)

Welcome! This project is a demonstration of how modern tech companies manage thousands of servers across different cloud providers (like Amazon AWS and Google Cloud) without ever clicking a single button in a web browser.

## 📖 The Core Concept (For Non-Techies)
Imagine you have to build identical fast-food restaurants in two different countries. Normally, you'd hire contractors in both countries and give them manual instructions. This is slow and prone to human error.

Instead, what if you could just write down a single "master blueprint" and save it in a secure vault? Then, you hire a robot that constantly reads that vault. The robot automatically goes to both countries, builds the restaurants, and ensures they always match the blueprint exactly. If a tornado knocks one down, the robot instantly rebuilds it because it knows what the blueprint says.

In this project:
- **The Blueprint Vault** is this Git repository.
- **The Builder Robot** is a tool called **Crossplane** (which builds the servers/infrastructure).
- **The Manager Robot** is a tool called **ArgoCD** (which installs the apps onto those servers and keeps them updated).
- **The Restaurants** are our clusters running on **AWS** and **GCP**.

This approach is called **GitOps**. It provides absolute security, instant disaster recovery, and the ability to manage massive global scale with a tiny team.

## 🌟 Enterprise Upgrades Included
- **Zero-Downtime Updates (Argo Rollouts):** When we update our app, we slowly release it to 20% of users first to make sure it doesn't crash before releasing it to everyone.
- **Absolute Security (Kyverno):** Strict rules that prevent any insecure applications from being deployed.
- **Top-Tier Visibility (Observability):** Dashboards that monitor the health of all servers globally.
- **Secret Management (Vault):** Sensitive passwords are never stored in the blueprints; they are fetched dynamically.

## 📋 Requirements & Prerequisites
To run this project on your own machine, you will need:
- **Docker** or **Docker Desktop** installed and running.
- **Git** installed.
- **kind** (Kubernetes in Docker) installed (`winget install Kubernetes.kind`).
- **Helm** (Kubernetes Package Manager) installed (`winget install Helm.Helm`).
- **AWS Account** with the AWS CLI installed and configured (`aws configure`).
- **Google Cloud Account** with a Service Account JSON key.

## 🚀 Getting Started (Technical)
1. Run `./bootstrap.sh` to create the local `kind` control plane (the robot's brain).
2. Inject your AWS/GCP credentials as Kubernetes Secrets (see `docs/secrets-setup.md`).
3. Apply the Crossplane providers and fleet compositions in the `infra/` folder.
4. Apply the ArgoCD configurations in the `gitops/` folder.
5. Watch the robots build and sync your entire cloud empire!
