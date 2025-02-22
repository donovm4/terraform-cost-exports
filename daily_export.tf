resource "azapi_resource" "daily_export" {
  type = "Microsoft.CostManagement/exports@2024-08-01"
  name = "tfexport-daily"
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
          rootFolderPath = "/root/updated"
        }
      }
      format = "Csv"
      partitionData = true
      schedule = {
        recurrence = "Daily"
        recurrencePeriod = {
          from = "2025-02-24T00:00:00Z"
          to = "2026-03-01T00:00:00Z"
        }
        status = "Active"
      }
    }
  }
}