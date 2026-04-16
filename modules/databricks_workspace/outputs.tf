output "workspace_id" {
  description = "Resource ID of the Azure Databricks workspace"
  value       = azurerm_databricks_workspace.this.id
}

output "workspace_url" {
  description = "HTTPS URL of the Databricks workspace"
  value       = "https://${azurerm_databricks_workspace.this.workspace_url}"
}

output "workspace_name" {
  description = "Name of the Databricks workspace"
  value       = azurerm_databricks_workspace.this.name
}

output "resource_group_name" {
  description = "Resource group where the workspace was deployed"
  value       = local.resource_group_name
}
