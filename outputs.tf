output "documentation" {
    description = "Links to Terraform AzAPI Microsoft.CostManagement exports documentation"
    value = "https://learn.microsoft.com/en-us/azure/templates/microsoft.costmanagement/2023-07-01-preview/exports?pivots=deployment-language-terraform"
}

output "focus_export_api_version" {
    description = "The focus export azapi resource"
    value = var.focus_export_api_version
}

output "non-focus_export_api_version" {
    description = "The GA apifor exports resource"
    value = var.nonfocus_export_api_version
}