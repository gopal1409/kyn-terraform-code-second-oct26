resource "azurerm_linux_virtual_machine" "web_vm" {
  name                = "${local.name_prefix}-linuxvm"
  resource_group_name = azurerm_resource_group.my_rg.name
  location            = azurerm_resource_group.my_rg.location
  size                = "Standard_F2"
  admin_username      = "azureuser"
  network_interface_ids = [
    azurerm_network_interface.web_nic.id,
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("${path.module}/ssh-keys/terraform-azure.pem.pub")
    #path.module is an meta argument in terraform which will look for your file in current directory where your terraform file is present. In this case it will look for the ssh key in the ssh-keys folder which is present in the same directory as this terraform file.
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  custom_data = filebase64("${path.module}/app.sh") #this will run the cloud-init script which is present in the cloud-init folder in the same directory as this terraform file.
}
output "public_ip_address" {
  value = azurerm_public_ip.web_public_ip.ip_address
}