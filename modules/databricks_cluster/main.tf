terraform {
  required_providers {
    databricks = {
      source = "databricks/databricks"
    }
  }
}

resource "databricks_cluster" "this" {
  cluster_name            = var.cluster_name
  spark_version           = var.spark_version
  node_type_id            = var.node_type_id
  autotermination_minutes = var.autotermination_minutes

  # Use autoscale OR fixed workers — not both
  num_workers = var.enable_autoscale ? null : var.num_workers

  dynamic "autoscale" {
    for_each = var.enable_autoscale ? [1] : []
    content {
      min_workers = var.min_workers
      max_workers = var.max_workers
    }
  }

  spark_conf  = var.spark_conf
  custom_tags = var.tags
}
