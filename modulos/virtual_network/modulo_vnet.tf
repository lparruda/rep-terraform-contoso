resource "azurerm_virtual_network" "example" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.local
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "example" {
for_each = { for k, v in var.subnet : k => v if v.address_prefixes != null}
depends_on = [ azurerm_virtual_network.example ]
  name                 = each.key
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = each.value.address_prefixes
}