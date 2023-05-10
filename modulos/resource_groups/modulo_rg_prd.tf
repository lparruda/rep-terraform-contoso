resource "azurerm_resource_group" "rg_prd" {
  name     = var.rg_name
  location = var.local
}
