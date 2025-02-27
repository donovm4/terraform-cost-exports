resource "azapi_resource" "daily_export_azapi" {
  type = var.nonfocus_export_api_version
  name = "tfexport-daily-azapi"
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
      partitionData = true
      schedule = {
        recurrence = "Daily"
        recurrencePeriod = {
          from = "2025-02-28T00:00:00Z"
          to = "2026-03-28T00:00:00Z"
        }
        status = "Active"
      }
    }
  }
}


resource "azurerm_subscription_cost_management_export" "daily_export_azurerm" {
  name                         = "tfexport-daily-azurerm"
  subscription_id              = data.azurerm_subscription.example.id
  recurrence_type              = "Daily"
  recurrence_period_start_date = "2025-02-28T00:00:00Z"
  recurrence_period_end_date   = "2026-03-28T00:00:00Z"
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