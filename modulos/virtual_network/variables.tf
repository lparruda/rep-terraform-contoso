variable "vnet_name" {
    type = string
  
}
variable "address_space" {
    type = list(string)
  
}
variable "local" {
    type = string
  
}
variable "resource_group_name" {
    type = string
  
}
variable "subnet" {
    type = map(object({
      address_prefixes = list(string)
    }))
    default = {
      "null" = {
        address_prefixes = null
        
      }
    }
  
}

