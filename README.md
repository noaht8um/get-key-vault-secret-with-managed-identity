# get-key-vault-secret-with-managed-identity

Simple container that gets a single Azure Key Vault secret using Managed Identity ([Relevant MS Doc](https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/tutorial-windows-vm-access-nonaad#access-data)).

Intended to be run on an Azure VM that has Managed Identity configured.

```
docker run --rm noaht8um/get-key-vault-secret-with-managed-identity -Vault 'my-az-key-vault' -Name 'my-az-key-vault-secret' -AsPlainText
```
