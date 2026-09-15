module "rg_prd" {
  source = "../modulos/resource_groups"

  rg_name = {
    "rg-contoso-prd" = {
      name  = "rg-contoso-prd"
      local = "brazilsouth"
    }
  }
}

import {
  to = module.rg_prd.azurerm_resource_group.rg_prd["rg-contoso-prd"]
  id = "/subscriptions/ac1c748c-cf7e-4d1e-82a0-d52c7062c9b2/resourceGroups/rg-contoso-prd"
}
