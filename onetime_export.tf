resource "azapi_resource" "one_time_export" {
  type = "Microsoft.CostManagement/exports@2024-08-01"
  name = "tfexport-onetime"
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
          rootFolderPath = "/root/updated"
        }
      }
      format = "Csv"
    }
  }
}