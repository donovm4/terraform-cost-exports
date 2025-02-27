resource "azapi_resource" "one_time_export_azapi" {
  type = var.nonfocus_export_api_version
  name = "tfexport-onetime-azapi"
  parent_id = data.azurerm_subscription.example.id
  location = "East US"
  body = {
    properties = {
      definition = {
        timeframe = "Custom"
        timePeriod = {
          from = "2025-01-01T00:00:00Z"
          to = "2025-02-01T00:00:00Z"
        }
        type = "ActualCost"
      }
      deliveryInfo = {
        destination = {
          container = azurerm_storage_container.example.name
          resourceId = azurerm_storage_account.example.id
          rootFolderPath = azurerm_storage_container.example.name
        }
      }
      format = "Csv"
    }
  }
}

/*

I believe one time exports are not possible with `azurerm` provider. Met with the following error:

error: 400: Request properties
│ validation failed: Missing definition timePeriod; specify a period in the past.

*/

/*

resource "azurerm_subscription_cost_management_export" "one_time_export_azurerm" {
  name                         = "tfexport-onetime-azurerm"
  subscription_id              = data.azurerm_subscription.example.id
  recurrence_type              = "Monthly"
  recurrence_period_start_date = "2025-01-01T00:00:00Z"
  recurrence_period_end_date   = "2025-02-01T00:00:00Z"
  file_format                  = "Csv"
  active = false

  export_data_storage_location {
    container_id     = azurerm_storage_container.example.id
    root_folder_path = "/root/updated"
  }

  export_data_options {
    type       = "ActualCost"
    time_frame = "Custom"
  }
}

*/