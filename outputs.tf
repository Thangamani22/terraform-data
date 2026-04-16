output "databricks_workspace_id" {
  description = "Resource ID of the Databricks workspace"
  value       = module.databricks_workspace.workspace_id
}

output "databricks_workspace_url" {
  description = "HTTPS URL to access the Databricks workspace"
  value       = module.databricks_workspace.workspace_url
}

output "databricks_workspace_name" {
  description = "Name of the Databricks workspace"
  value       = module.databricks_workspace.workspace_name
}

output "databricks_resource_group_name" {
  description = "Resource group where the workspace was deployed"
  value       = module.databricks_workspace.resource_group_name
}

output "databricks_cluster_id" {
  description = "ID of the Databricks cluster"
  value       = module.databricks_cluster.cluster_id
}

output "databricks_cluster_name" {
  description = "Name of the Databricks cluster"
  value       = module.databricks_cluster.cluster_name
}
