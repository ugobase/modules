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