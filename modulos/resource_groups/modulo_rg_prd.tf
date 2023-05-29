resource "azurerm_resource_group" "rg_prd" {
  for_each = { for k, v in var.rg_name : k => v if v.name != null}
  name     = each.key
  location = each.value.local
}
