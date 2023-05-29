resource "azurerm_network_security_group" "example" {
  name                = var.azurerm_network_security_group
  location            = var.local
  resource_group_name = var.azurerm_resource_group
}
resource "azurerm_network_security_rule" "security_rule" {
  depends_on = [ azurerm_network_security_group.example ]
for_each = { for k, v in var.azurerm_network_security_rule : k => v if v.priority != null}

    name                       = each.key
    access = each.value.access
    destination_address_prefix = each.value.destination_address_prefix
    destination_port_range = each.value.destination_port_range
    #destination_port_ranges = each.value.destination_port_ranges
    destination_port_ranges     = each.value.destination_port_ranges
    direction = each.value.direction
    priority = each.value.priority
    protocol = each.value.protocol
    source_address_prefix = each.value.source_address_prefix
    source_port_range = each.value.source_port_range
    resource_group_name = var.azurerm_resource_group
    network_security_group_name = var.azurerm_network_security_group


  }

resource "azurerm_subnet_network_security_group_association" "example" {
  
  for_each = var.azurerm_subnet_network_security_group_association
  subnet_id                 = each.value.subnet_id
  network_security_group_id = azurerm_network_security_group.example.id
}
  

