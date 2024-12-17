data "aws_ami" "instance-ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}



resource "aws_key_pair" "ugo-key" {
  key_name   = var.key_name
  public_key = file(var.keypair)
}



resource "aws_instance" "web" {
  ami           = data.aws_ami.instance-ami.id
  instance_type = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  subnet_id = var.subnet_id[0]
  vpc_security_group_ids = [var.sg_id]
  key_name = var.key_name
  /*
  user_data = file("userdata.tpl")
  */

  tags = {
    Name = "${local.name}-instance"
  }
}
