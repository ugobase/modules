module "vpc" {
  source            = "./modules/vpc"
  vpc_cidr_block    = var.vpc_cidr_block
  region            = var.region
  subnet_cidr_block = var.subnet_cidr_block
  public-launch     = var.public-launch
}


module "ec2" {
  source                      = "./modules/ec2"
  keypair                     = var.keypair
  key_name                    = var.key_name
  instance_type               = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  subnet_id                   = module.vpc.subnet-id
  sg_id                       = module.vpc.sg
}


