output "cluster_id" {
  description = "Unique ID of the Databricks cluster"
  value       = databricks_cluster.this.id
}

output "cluster_name" {
  description = "Display name of the Databricks cluster"
  value       = databricks_cluster.this.cluster_name
}
