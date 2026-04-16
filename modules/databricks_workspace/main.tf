resource "azurerm_resource_group" "this" {
  count    = var.create_resource_group ? 1 : 0
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

locals {
  resource_group_name = var.create_resource_group ? azurerm_resource_group.this[0].name : var.resource_group_name
}

resource "azurerm_databricks_workspace" "this" {
  name                        = var.workspace_name
  resource_group_name         = local.resource_group_name
  location                    = var.location
  sku                         = var.sku
  managed_resource_group_name = var.managed_resource_group_name

  # Optional: VNet injection — set vnet_id and subnet names to enable
  dynamic "custom_parameters" {
    for_each = var.vnet_id != null ? [1] : []
    content {
      virtual_network_id                                   = var.vnet_id
      private_subnet_name                                  = var.private_subnet_name
      public_subnet_name                                   = var.public_subnet_name
      private_subnet_network_security_group_association_id = var.private_subnet_nsg_association_id
      public_subnet_network_security_group_association_id  = var.public_subnet_nsg_association_id
    }
  }

  tags = var.tags
}
