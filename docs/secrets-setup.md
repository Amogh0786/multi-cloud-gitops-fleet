# Crossplane Secrets Setup

To allow Crossplane to provision resources on AWS and GCP, you need to provide it with the appropriate credentials. These credentials will be stored as Kubernetes Secrets in the control plane cluster.

## AWS Credentials

1.  Ensure you have your AWS credentials configured locally in `~/.aws/credentials`.
2.  Create a Kubernetes Secret containing your AWS credentials. Crossplane's AWS provider uses the default profile.

```bash
kubectl create secret generic aws-secret \
  -n crossplane-system \
  --from-file=creds=~/.aws/credentials
```

## GCP Service Account

1.  Ensure you have a GCP Service Account with the necessary permissions (e.g., Kubernetes Engine Admin, Compute Admin).
2.  Generate a JSON key for this Service Account and save it locally, for example, as `gcp-credentials.json`.
3.  Create a Kubernetes Secret containing your GCP Service Account JSON key.

```bash
kubectl create secret generic gcp-secret \
  -n crossplane-system \
  --from-file=creds=./gcp-credentials.json
```
