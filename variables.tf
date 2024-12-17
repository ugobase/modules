variable "region" {
  description = "The AWS region where the VPC will be created"
  type        = string
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "subnet_cidr_block" {
  description = "The CIDR block for the SUBNET"
  type        = list(string)
}



variable "public-launch" {
  description = "The BOOLEAN VALUE OF THE PUBLIC IP ON LAUNCH"
  type        = bool
}


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




