function Get-KeyVaultSecretWithManagedIdentity {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$VaultName,

        [Parameter(Mandatory = $true)]
        [string]$Name,

        [Parameter(Mandatory = $false)]
        [switch]$AsPlainText
    )

    $TokenRequest = @{
        'Uri'     = 'http://169.254.169.254/metadata/identity/oauth2/token'
        'Method'  = 'Get'
        'Headers' = @{'Metadata' = $true }
        'Body'    = @{'api-version' = '2018-02-01'; 'resource' = 'https%3A%2F%2Fvault.azure.net' }
    }

    $Token = ConvertTo-SecureString -String (Invoke-RestMethod @TokenRequest).access_token -AsPlainText

    $SecretRequest = @{
        'Uri'            = ('https://' + $VaultName + '.vault.azure.net/secrets/' + $Name)
        'Method'         = 'Get'
        'Authentication' = 'Bearer'
        'Token'          = $Token
        'Body'           = @{'api-version' = '2016-10-01' }
    }

    if ($AsPlainText) {
        return (Invoke-RestMethod @SecretRequest).value
    }

    $Secret = ConvertTo-SecureString -String (Invoke-RestMethod @SecretRequest).value -AsPlainText

    return $Secret
}
