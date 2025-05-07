locals {
  rg_name   = "${var.resource_group_name}-${var.environment}-${var.business_unit}"
  vnet_name = "${var.business_unit}-${var.environment}-${var.resource_group_name}"

  service_name = "devops"
  owner        = "onimoleoflagos"

  common_tags = {
    service = local.service_name
    owner   = local.owner
<<<<<<< HEAD
    Tag1    = "CommitAye"
=======
    Tag1 =    "Terraform-Cloud-Demo1"
>>>>>>> eef911f28ae6f862a034aaa10663b424a0401a6b
  }
}

