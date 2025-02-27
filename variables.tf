variable "focus_export_api_version" {
  description = "The version of the Azure API to use"
  type        = string
  default     = "Microsoft.CostManagement/exports@2023-07-01-preview"
}

variable "focus_data_version" {
  description = "The version of the data to use"
  type        = string
  default     = "1.0-preview(v1)"
  validation {
    condition     = contains(["1.0r2", "1.0", "1.0-preview(v1)"], var.focus_data_version)
    error_message = "The acceptable values for `focus_data_version` are `\"1.0\"`, `\"Gateway\"`, or `\"Standard\"`."
  }
}

variable "nonfocus_export_api_version" {
  description = "The version of the Azure API to use"
  type        = string
  default     = "Microsoft.CostManagement/exports@2024-08-01"
}
