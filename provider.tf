terraform {
    required_version = ">= 0.14.11"
    required_providers {
         openstack = {
         source = "terraform-provider-openstack/openstack"
         version = "~> 1.35.0"
         }
       }
     }

provider "openstack" {
      user_name = var.openstack_username
      password = var.openstack_password
      auth_url = var.openstack_auth_url
      domain_name = var.openstack_domain
      tenant_name = var.openstack_project
     }
