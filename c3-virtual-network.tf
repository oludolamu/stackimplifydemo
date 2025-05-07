resource "azurerm_virtual_network" "vnetalias" {
  name = local.vnet_name
  #name                = "${var.business_unit}-${var.environment}-${var.resource_group_name}"
  location            = azurerm_resource_group.myrg1alias.location
  resource_group_name = azurerm_resource_group.myrg1alias.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
  tags = {
    "environment" = "dev"
  }
}


resource "azurerm_subnet" "subnetalias" {
  name                 = "my-subnet"
  resource_group_name  = azurerm_resource_group.myrg1alias.name
  virtual_network_name = azurerm_virtual_network.vnetalias.name
  address_prefixes     = ["10.0.1.0/24", "10.0.2.0/24"]
}















resource "azurerm_public_ip" "pubipalias" {
  name                = "mypubipolu-${random_string.myrandom.id}"
  resource_group_name = azurerm_resource_group.myrg1alias.name
  location            = azurerm_resource_group.myrg1alias.location
  allocation_method   = "Static"
  domain_name_label   = "app1-vm-${random_string.myrandom.id}"
  depends_on = [
    azurerm_virtual_network.vnetalias,
    azurerm_subnet.subnetalias
  ]

  tags = {
    "environment" = "Production"
    "createdby"   = "DolamuOmoAye"
  }
  lifecycle {
    ignore_changes = [tags, ]
  }
}

resource "azurerm_network_interface" "nicalias" {
  name                = "vm-nic-1"
  location            = azurerm_resource_group.myrg1alias.location
  resource_group_name = azurerm_resource_group.myrg1alias.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnetalias.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    "createdby" = "Oludolamu"
  }
}
