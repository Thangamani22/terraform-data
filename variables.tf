# --- Azure ---

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "location" {
  description = "Azure region for all resources"
  type        = string
  default     = "eastus"
}

# --- Resource Group ---

variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
}

variable "create_resource_group" {
  description = "Set to true to create a new resource group, false to use an existing one"
  type        = bool
  default     = true
}

# --- Databricks Workspace ---

variable "workspace_name" {
  description = "Name of the Azure Databricks workspace"
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
  description = "Name of the managed resource group created by Databricks (optional)"
  type        = string
  default     = null
}

# --- Databricks Cluster ---

variable "cluster_name" {
  description = "Display name for the Databricks cluster"
  type        = string
}

variable "spark_version" {
  description = "Databricks Runtime version (e.g., '13.3.x-scala2.12')"
  type        = string
  default     = "13.3.x-scala2.12"
}

variable "node_type_id" {
  description = "Azure VM size for cluster nodes (e.g., 'Standard_DS3_v2')"
  type        = string
  default     = "Standard_DS3_v2"
}

variable "autotermination_minutes" {
  description = "Auto-terminate the cluster after N minutes of inactivity (0 = disabled)"
  type        = number
  default     = 30
}

variable "enable_autoscale" {
  description = "Enable autoscaling. When true, min/max_workers are used; otherwise num_workers is used"
  type        = bool
  default     = true
}

variable "min_workers" {
  description = "Minimum number of workers when autoscaling is enabled"
  type        = number
  default     = 1
}

variable "max_workers" {
  description = "Maximum number of workers when autoscaling is enabled"
  type        = number
  default     = 5
}

variable "num_workers" {
  description = "Fixed number of workers when autoscaling is disabled"
  type        = number
  default     = 2
}

variable "spark_conf" {
  description = "Map of Spark configuration key-value pairs"
  type        = map(string)
  default     = {}
}

# --- Common Tags ---

variable "tags" {
  description = "Tags applied to all resources"
  type        = map(string)
  default     = {}
}

