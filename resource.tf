resource "azurerm_resource_group" "my_rg" { #refrence name of the resource group
  name = "${local.name_prefix}-${var.resource_group_name}"
  #sap-dev-gopal-rg
  location = var.location
  tags     = local.project_tag
}