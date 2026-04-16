terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.54"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# The Databricks provider authenticates using the workspace resource ID.
# Authentication defaults to Azure CLI. For a Service Principal, set these
# environment variables before running Terraform:
#   ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_TENANT_ID
#
# IMPORTANT — Two-step initial deployment:
#   The databricks provider requires the workspace to exist before it can
#   initialise. On first deploy, run:
#
#     Step 1:  terraform apply -target=module.databricks_workspace
#     Step 2:  terraform apply
#
provider "databricks" {
  azure_workspace_resource_id = module.databricks_workspace.workspace_id
}
