resource "azurerm_public_ip" "web_public_ip" {
  name                = "${local.name_prefix}-public-ip"
  resource_group_name = azurerm_resource_group.my_rg.name
  location            = azurerm_resource_group.my_rg.location
  allocation_method   = "Static"
  sku                 = "Standard" #publicip ip will be spread across regions and will be highly available across zones
  #basic: the public ip created in one single az 

  tags = local.project_tag
}