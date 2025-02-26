# This ensures we have unique CAF compliant names for our resources.
module "naming" {
  source  = "Azure/naming/azurerm"
  version = ">= 0.3.0"
}

# Reading in subscription information
data "azurerm_subscription" "example" {}

resource "azurerm_resource_group" "example" {
  name     = module.naming.resource_group.name_unique
  location = "East US"

  lifecycle {
    # Ignoring changes to tags from policies
    # Helps clean up plan/apply output
    ignore_changes = [
        tags
    ]
  }
}

resource "azurerm_storage_account" "example" {
  name                = "${module.naming.storage_account.name_unique}tf"
  resource_group_name = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "example" {
  name                 = "tfcontainer"
  storage_account_id = azurerm_storage_account.example.id
}
