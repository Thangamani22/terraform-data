variable "cluster_name" {
  description = "Display name for the Databricks cluster"
  type        = string
}

variable "spark_version" {
  description = "Databricks Runtime version (e.g., '13.3.x-scala2.12'). Check https://docs.databricks.com/release-notes/runtime/releases.html"
  type        = string
}

variable "node_type_id" {
  description = "Azure VM size used for cluster nodes (e.g., 'Standard_DS3_v2')"
  type        = string
}

variable "autotermination_minutes" {
  description = "Auto-terminate the cluster after N minutes of inactivity. Set to 0 to disable"
  type        = number
  default     = 30
}

variable "enable_autoscale" {
  description = "Enable autoscaling. When true, min_workers and max_workers are used; otherwise num_workers is used"
  type        = bool
  default     = true
}

variable "min_workers" {
  description = "Minimum number of worker nodes when autoscaling is enabled"
  type        = number
  default     = 1
}

variable "max_workers" {
  description = "Maximum number of worker nodes when autoscaling is enabled"
  type        = number
  default     = 5
}

variable "num_workers" {
  description = "Fixed number of worker nodes when autoscaling is disabled"
  type        = number
  default     = 2
}

variable "spark_conf" {
  description = "Map of Spark configuration key-value pairs to apply to the cluster"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Custom tags to attach to the cluster"
  type        = map(string)
  default     = {}
}
