module "rg_dev" {
  source = "../../../modulos/resource_groups"

  rg_name = {
    "rg-contoso-dev" = {
      name  = "rg-contoso-dev"
      local = "brazilsouth"
    }
  }
}

