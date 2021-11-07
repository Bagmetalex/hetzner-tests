
# Set the variable value in *.tfvars file
# or using the -var="hcloud_token=..." CLI option
variable "hcloud_token" {
  description = "Hetzner Cloud Provider API TOKEN"
  sensitive   = true
 #default     = "VX91yMGeRQEZ5SRvM10zpuBzbIWaDUBfMy0lsYDZ3WREI2HXXXXXXXXXXXXXX"
}
variable "hostname" {
  type = list
  default = ["master1","worker1"]
}
variable "type_vm" {
  type = list
  default = ["cx21", "cx11"]
}
variable "os_type" {
  description = "VM OS type"
  default     = "centos-7"
}




