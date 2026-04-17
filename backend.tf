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
#   az group create --name tf-backend-rg --location eastus
#   az storage account create --name tfstatedemo8754952 --resource-group tf-backend-rg --sku Standard_LRS
#   az storage container create --name tfstate --account-name tfstatedemo8754952
