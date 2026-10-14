resource "azurerm_network_interface" "web_nic" {
  name                = "${local.name_prefix}-nic"
  resource_group_name = azurerm_resource_group.my_rg.name
  location            = azurerm_resource_group.my_rg.location
  

  ip_configuration { #this nic card will get an public and private ip
    name                          = "internal"
    subnet_id                     = azurerm_subnet.web_subnet.id 
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.web_public_ip.id
  }
}