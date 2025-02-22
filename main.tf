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


# resource "azurerm_subscription_cost_management_export" "example" {
#   name                         = "tfexport"
#   subscription_id = data.azurerm_subscription.example.id
#   recurrence_type              = "Monthly"
#   recurrence_period_start_date = "2025-01-01T00:00:00Z"
#   recurrence_period_end_date   = "2025-03-01T00:00:00Z"
#   file_format                  = "Csv"
# #   active = false 

#   export_data_storage_location {
#     container_id     = azurerm_storage_container.example.resource_manager_id
#     root_folder_path = "/root/updated"
#   }

#   export_data_options {
#     type       = "ActualCost"
#     time_frame = "MonthToDate"
#   }
# }

