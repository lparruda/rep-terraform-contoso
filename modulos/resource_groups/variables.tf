variable "rg_name" {
    type = map(object({
      name = string
      local = string
    }))
    default = {
      null = {
        name = null
        local = null
      }
    }
  
}

