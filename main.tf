module "databricks_workspace" {
  source = "./modules/databricks_workspace"

  workspace_name              = var.workspace_name
  resource_group_name         = var.resource_group_name
  create_resource_group       = var.create_resource_group
  location                    = var.location
  sku                         = var.sku
  managed_resource_group_name = var.managed_resource_group_name
  tags                        = var.tags
}

module "databricks_cluster" {
  source = "./modules/databricks_cluster"

  cluster_name            = var.cluster_name
  spark_version           = var.spark_version
  node_type_id            = var.node_type_id
  autotermination_minutes = var.autotermination_minutes
  enable_autoscale        = var.enable_autoscale
  min_workers             = var.min_workers
  max_workers             = var.max_workers
  num_workers             = var.num_workers
  spark_conf              = var.spark_conf
  tags                    = var.tags

  depends_on = [module.databricks_workspace]
}
