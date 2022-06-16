# names
variable "project-name" {
  default = "admin"
}

# 
variable "image-name" {
  default = "2e6a0ef7-f28e-4213-ae93-3deb602c3d87"
}

variable "flavor-name" {
  default = "m1.medium"
}

# networks
# the below variable have to defined that is provider network.
variable "deploy-addr" {
  default = "172.16.5.4"
}

# should check the external's network uuid that will use at the vrouter.
variable "external-network-uuid" {
  default = "external-network-uuid FIXME"
}

variable "pubkey" {
  default = "pubkey FIXME"
}
