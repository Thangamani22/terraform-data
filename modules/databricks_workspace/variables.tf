variable "workspace_name" {
  description = "Name of the Azure Databricks workspace"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
}

variable "create_resource_group" {
  description = "Set to true to create a new resource group, false to use an existing one"
  type        = bool
  default     = true
}

variable "location" {
  description = "Azure region where the workspace will be deployed"
  type        = string
}

variable "sku" {
  description = "SKU tier for the Databricks workspace: standard, premium, or trial"
  type        = string
  default     = "premium"

  validation {
    condition     = contains(["standard", "premium", "trial"], var.sku)
    error_message = "Valid values for sku are: standard, premium, trial."
  }
}

variable "managed_resource_group_name" {
  description = "Name of the managed resource group created by the Databricks workspace (optional)"
  type        = string
  default     = null
}

# --- VNet Injection (optional) ---

variable "vnet_id" {
  description = "Resource ID of an existing VNet for VNet injection (leave null to skip)"
  type        = string
  default     = null
}

variable "private_subnet_name" {
  description = "Name of the private subnet for VNet injection"
  type        = string
  default     = null
}

variable "public_subnet_name" {
  description = "Name of the public subnet for VNet injection"
  type        = string
  default     = null
}

variable "private_subnet_nsg_association_id" {
  description = "NSG association ID for the private subnet"
  type        = string
  default     = null
}

variable "public_subnet_nsg_association_id" {
  description = "NSG association ID for the public subnet"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to all resources in this module"
  type        = map(string)
  default     = {}
}
