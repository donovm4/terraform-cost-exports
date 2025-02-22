resource "azapi_resource" "monthly_export" {
  type = "Microsoft.CostManagement/exports@2024-08-01"
  name = "tfexport-monthly"
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