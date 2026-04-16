# Remote state backend — uncomment and configure to store state in Azure Blob Storage.
#
terraform {
  backend "azurerm" {
    resource_group_name  = "tf-backend-rg"
    storage_account_name = "tfstatedemo8754952"
    container_name       = "tfstate"
    key                  = "databricks/terraform.tfstate"
  }
}
#
# Run the following to create the storage account (one-time setup):
#
#   az group create --name rg-terraform-state --location eastus
#   az storage account create --name stterraformstate --resource-group rg-terraform-state --sku Standard_LRS
#   az storage container create --name tfstate --account-name stterraformstate
