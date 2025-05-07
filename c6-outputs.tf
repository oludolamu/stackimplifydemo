output "resource_group_id" {
  value       = azurerm_resource_group.myrg1alias.id
  description = "Resource group ID"

}

output "resource_group_name" {
  value       = azurerm_resource_group.myrg1alias.name
  description = "Resource group name"

}

output "virtual_network_name" {
  value       = azurerm_virtual_network.vnetalias.name
  description = "Vnet name"

}