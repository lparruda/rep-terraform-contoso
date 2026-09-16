module "network_dev" {
    source = "../../../modulos/virtual_network"

    vnet_name = "vnet_dev"
    address_space = ["10.1.0.0/16"]
    local = "brazilsouth"
    resource_group_name = "rg-contoso-dev"

    subnet = {
      "subnet_dev1" = {
        address_prefixes = ["10.1.1.0/24"]
      }
      "subnet_dev2" = {
        address_prefixes = ["10.1.2.0/24"]
      }
      
    }

}
