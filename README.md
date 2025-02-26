# Terraform Configurations for Cost Exports

## Goal(s)

FinOps Hubs + Terraform

## Objective(s)

- [x] Configure cost exports with `azapi`
  - [x] daily
  - [x] monthly
  - [x] one-time
- [x] Configure cost exports with `azurerm`
  - [x] daily
  - [x] monthly
  - [ ] one-time
- [ ] Determine which provider  is preferred
  - file partitioning cannot be toggled with `azurerm`
  - one-time exports cannot be configured with `azurerm`


## Leverages

- [`azapi`](https://registry.terraform.io/providers/Azure/azapi/latest/docs)
- [`azurerm`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [`Azure/naming/azurerm`](https://registry.terraform.io/modules/Azure/naming/azurerm/latest)
