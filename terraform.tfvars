# Copy this file to terraform.tfvars and fill in your values.
# Never commit terraform.tfvars to source control if it contains secrets.

# --- Azure ---
subscription_id = "6664acba-3ca3-4e91-92ee-8862dd450654"
location        = "eastus"

# --- Resource Group ---
resource_group_name   = "rg-databricks-demo"
create_resource_group = true

# --- Databricks Workspace ---
workspace_name              = "dbw-project-demo"
sku                         = "premium"
managed_resource_group_name = "rg-databricks-managed-demo"

# --- Databricks Cluster ---
cluster_name            = "cluster-project-demo"
spark_version           = "13.3.x-scala2.12"
node_type_id            = "Standard_D4ds_v5"
autotermination_minutes = 10

# Autoscaling
enable_autoscale = false
min_workers      = 1
max_workers      = 5
num_workers      = 1 # used only when enable_autoscale = false

# Spark configuration
spark_conf = {
  "spark.databricks.delta.preview.enabled" = "true"
}

# --- Tags ---
tags = {
  Environment = "demo"
  Project     = "my-project"
  ManagedBy   = "Terraform"
  Owner       = "thangamani"
}