# HashiCorp Vault Integration

1. Deploy External Secrets Operator (managed by ArgoCD).
2. Create a `SecretStore` that points to your Vault instance.
3. Replace hardcoded ProviderConfig secrets with `ExternalSecret` manifests that sync from Vault.
