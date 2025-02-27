resource "azapi_resource" "focus_export_azapi" {
  type = var.focus_export_api_version
  name = "tfexport-focus-onetime-azapi"
  parent_id = data.azurerm_subscription.example.id
  location = "East US"
  body = {
    properties = {
      dataOverwriteBehavior = "OverwritePreviousReport"
      definition = {
        dataSet = {
          configuration = {
            dataVersion = var.focus_data_version
          }
        }
        
        timeframe = "Custom"
        timePeriod = {
          from = "2025-01-01T00:00:00Z"
          to = "2025-01-31T00:00:00Z"
        }
        type = "FocusCost"
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
        status = "Inactive"
      }
    }
  }
}