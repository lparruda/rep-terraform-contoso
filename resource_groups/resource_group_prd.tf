module "rg_prd" {
  source = "../modulos/resource_groups"
  rg_name = {
    "rg-bradesco-prd" = {
      name = "rg-bradesco-prd"
      local = "brazilsouth"
    }
    "rg-bradesco-prd-nsg" = {
      name = "rg-bradesco-prd-nsg"
      local = "brazilsouth"
    }
  }


}


