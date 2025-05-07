# Create Resource Group  - uses default provider
resource "azurerm_resource_group" "myrg1alias" {
  name = "${var.resource_group_name}-${var.environment}-${var.business_unit}"
  #name     = local.rg_name
  location = var.resource_group_location
}
