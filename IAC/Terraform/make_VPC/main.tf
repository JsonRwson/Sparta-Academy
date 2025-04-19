# Where to make the infrastructure (what cloud provider)
provider "aws" {
  # which region to use
  region = "eu-west-1"

  # Running "terraform init" will download dependencies for the provider

}

resource "aws_vpc" "project_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "tech503-jason-TF-VPC"
  }
}

resource "aws_internet_gateway" "project_IG" {
  vpc_id = aws_vpc.project_vpc.id

  tags = {
    Name = "tech503-jason-TF-VPC-IG"
  }
}

resource "aws_subnet" "public_subnets" {
  count             = length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.project_vpc.id
  cidr_block        = element(var.public_subnet_cidrs, count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = "Public Subnet ${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.project_vpc.id
  cidr_block        = element(var.private_subnet_cidrs, count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = "Private Subnet ${count.index + 1}"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.project_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project_IG.id
  }

  tags = {
    Name = "tech503-jason-public-rt"
  }

}

resource "aws_route_table_association" "public_subnet_association" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.public_rt.id
}

# Create a security group for the EC2 instance
resource "aws_security_group" "app_instance_sg" {
  # Name for the security group
  name        = var.aws_instance_name
  description = var.aws_instance_sg_name
  vpc_id      = aws_vpc.project_vpc.id

  # Dynamic ingress rules
  dynamic "ingress" {
    for_each = var.allowed_ingress_ports
    content {
      description = "Allow port ${ingress.value}"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = var.allowed_cidrs
    }
  }
  # "Egress" is used for outbound rules
}

data "local_file" "user_data" {
  filename = "../../../Scripts/userdata-script.sh"
}

# Which service / resource
# "app_instance" is how we refer to the instance in main.tf
resource "aws_instance" "app_instance" {
  count = length(var.public_subnet_cidrs)

  # Which AMI to use?
  ami = "ami-0d10e8202219d4d79"

  # What type of instance to use?
  instance_type = var.aws_instance_type

  subnet_id = element(aws_subnet.public_subnets[*].id, count.index)

  # Do we need a public IP?
  associate_public_ip_address = true

  # Associate the security group with the instance
  vpc_security_group_ids = [aws_security_group.app_instance_sg.id]

  user_data = "${data.local_file.user_data.content}"

  # Name the resource (in AWS)
  tags = {
    Name = var.aws_instance_name
  }
}