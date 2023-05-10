module "rg_prd" {
  source = "../modulos/resource_groups"
  rg_name = "rg-bradesco-prd"
  local = "brazilsouth"
  
}