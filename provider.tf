provider "openstack" {
  tenant   = "admin"
  username = "user"
  password = "user@123"
  auth_url = "http://172.16.4.16:5000/v3"
  region   = "default"
}
