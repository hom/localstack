# PowerShell module manifest
Module
{
    Name = "LocalStack"
    ModuleVersion = "1.0.0"
    Author = "Meng Jun"
    CompanyName = "Custom"
    Description = "A PowerShell module for managing localstack."
}

# Define the commands in the module
function Set-LocalStack {
    # Set the proxy environment variables
    $Env:AWS_ACCESS_KEY_ID="test"
    $Env:AWS_SECRET_ACCESS_KEY="test"
    $Env:AWS_DEFAULT_REGION="cn-northwest-1"
    $Env:AWS_ENDPOINT_URL="http://localhost:4566"

    Write-Host "LocalStack environments have been set."
}

function Remove-LocalStack {
    # Remove the proxy environment variables
    Remove-Item -Path "env:\ACCESS_KEY_ID"
    Remove-Item -Path "env:\AWS_SECRET_ACCESS_KEY"
    Remove-Item -Path "env:\AWS_DEFAULT_REGION"
    Remove-Item -Path "env:\AWS_ENDPOINT_URL"

    Write-Host "LocalStack environments have been removed."
}

# Export the commands so they can be used outside the module
Export-ModuleMember -Function Set-LocalStack, Remove-LocalStack

