variable "keypair" {
  description = "The key used to create the server"
  type        = string
}


variable "key_name" {
  description = "The name of the public key"
  type        = string
}


variable "instance_type" {
  description = "The type of hardware used in creation of instance"
  type        = string
}

variable "associate_public_ip_address" {
  description = "Boolean Value of associating public IP address"
  type        = bool
}

variable "sg_id" {}

variable "subnet_id" {}

