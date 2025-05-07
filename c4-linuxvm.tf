resource "azurerm_linux_virtual_machine" "linuxvmalias" {
  name                = "linuxhost"
  computer_name       = "linuxhost"
  resource_group_name = azurerm_resource_group.myrg1alias.name
  location            = azurerm_resource_group.myrg1alias.location
  size                = "Standard_F2"
  admin_username      = "azureuser"
  network_interface_ids = [
    azurerm_network_interface.nicalias.id,
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("${path.module}/ssh-keys/terraform-azure.pub")
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

  custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init")

  tags = {
    "createdby"    = "Dolamu"
    "createdusing" = "Terraform"
  }

  connection {
    type        = "ssh"
    host        = self.public_ip_address
    user        = self.admin_username
    private_key = file("${path.module}/ssh-keys/terraform-azure.pem")
  }
}
