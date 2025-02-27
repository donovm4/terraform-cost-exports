resource "azapi_resource" "monthly_export_azapi" {
  type = var.nonfocus_export_api_version
  name = "tfexport-monthly-azapi"
  parent_id = data.azurerm_subscription.example.id
  location = "East US"
  body = {
    properties = {
      definition = {
        timeframe = "MonthToDate"
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
      schedule = {
        recurrence = "Monthly"
        recurrencePeriod = {
          from = "2025-03-01T00:00:00Z"
          to = "2025-06-01T00:00:00Z"
        }
        status = "Active"
      }
    }
  }
}

resource "azurerm_subscription_cost_management_export" "monthly_export_azurerm" {
  name                         = "tfexport-monthly-azurerm"
  subscription_id              = data.azurerm_subscription.example.id
  recurrence_type              = "Monthly"
  recurrence_period_start_date = "2025-03-01T00:00:00Z"
  recurrence_period_end_date   = "2025-06-01T00:00:00Z"
  file_format                  = "Csv"
  active = true 

  export_data_storage_location {
    container_id     = azurerm_storage_container.example.id
    root_folder_path = "/root/updated"
  }

  export_data_options {
    type       = "ActualCost"
    time_frame = "MonthToDate"
  }
}