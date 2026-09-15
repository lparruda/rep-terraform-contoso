module "network_prd" {
    source = "../modulos/virtual_network"

    vnet_name = "vnet_prd"
    address_space = ["10.0.0.0/16"]
    local = "brazilsouth"
    resource_group_name = "rg-contoso-prd"

    subnet = {
      "subnet_prd1" = {
        address_prefixes = ["10.0.2.0/24"]
      }
      "subnet_prd2" = {
        address_prefixes = ["10.0.3.0/24"]
      }
      
    }



}
