provider "aws" {
  region = var.region
}



resource "aws_vpc" "first-vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "${local.vpc}_prod"
  }
}

resource "aws_subnet" "first-vpc-subnet" {
  for_each = { for idx, cidr in var.subnet_cidr_block : idx => cidr }
  
  vpc_id                  = aws_vpc.first-vpc.id
  cidr_block              = each.value
  availability_zone       = data.aws_availability_zones.az.names[each.key]
  map_public_ip_on_launch = var.public-launch

  tags = {
    Name = "Public_subnet_${each.key + 1}"
  }
}

resource "aws_security_group" "allow_traffic" {
  name        = "allow_traffic"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.first-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.env}-sg"
  }
}

resource "aws_internet_gateway" "first-igw" {
  vpc_id = aws_vpc.first-vpc.id

  tags = {
    Name = "${local.vpc}_igw"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.first-vpc.id

  tags = {
    Name = "${local.vpc}_rt"
  }
}

resource "aws_route" "route" {
  route_table_id         = aws_route_table.rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.first-igw.id
}

resource "aws_route_table_association" "rt-first" {
  for_each    = aws_subnet.first-vpc-subnet
  subnet_id      = each.value.id
  route_table_id = aws_route_table.rt.id
}
