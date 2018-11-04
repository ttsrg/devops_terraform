variable "zone_id" {
  type = "string"
  default = "ZUYOKXBWM9MWO"
}

variable "name" {
  default = "calc"
}

variable "environment" {
  default = "stage"
}
variable "ssh_key_path" {
  default = "~/.ssh/id_rsa.pub"
}

variable "allowed_mgmnt_address" {
  description = "Allowed address for ssh connect"
  type = "list"
  default = ["46.219.216.0/24", "217.20.191.18/32"]
}

variable "allowed_mgmnt_ports" {
  description = "Allowed ports for mgmnt connections"
  type = "list"
  default = ["22"]
}
variable "allowed_ports_web" {
  description = "allowed port to calc web"
  type = "list"
  default = ["80", "443"]
}

variable "allowed_ports_api" {
  description = "allowed port to calc api"
  type = "list"
  default = ["8080"]
}
