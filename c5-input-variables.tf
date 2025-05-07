variable "business_unit" {
  type        = string
  sensitive   = false
  default     = "hr"
  description = "I just dey whine"

}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
  default     = "myrg"
}

variable "resource_group_location" {
  description = "Resource Group Location"
  type        = string
  default     = "eastus"
}

variable "environment" {
  description = "Environment Name"
  type        = string
  default     = "sinzuenv"
}

variable "virtual_network_name" {
  description = "Virtual Network Name"
  type        = string
  default     = "myvnet"
}

variable "vnet_address_space_dev" {
  description = "devvnetaddress"
  type        = list(string)
  default     = ["10.0.0.0/16"]

}

variable "vnet_address_space_all" {
  description = "othersnetaddressspace"
  type        = list(string)
  default     = ["10.1.0.0/16", "10.2.0.0/16", "10.3.0.0/16"]

}


variable "common_tags" {
  type = map(string)
  default = {
    "createdusing" = "terraform"
    "clitool"      = "Azure"
  }

}

variable "db_name" {
  description = "name of my db"
  type        = string
  sensitive   = true
  default     = "oludolamudbjsjd"

}

variable "db_password" {
  description = "pw of my db"
  sensitive   = true
  type        = string
  default     = "basedonkentrojejehjrhr"

}

variable "db_username" {
  description = "name of my db"
  type        = string
  sensitive   = true
  default     = "dbnameoludolamuzi"

}