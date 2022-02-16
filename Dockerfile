FROM mcr.microsoft.com/powershell:latest
COPY Get-KeyVaultSecretWithManagedIdentity.ps1 .
ENTRYPOINT [ "pwsh", "-c", ". /Get-KeyVaultSecretWithManagedIdentity.ps1 && Get-KeyVaultSecretWithManagedIdentity"]
