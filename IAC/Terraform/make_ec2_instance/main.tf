# Where to make the infrastructure (what cloud provider)
provider "aws" {
  # which region to use
  region = var.aws_region

  # Running "terraform init" will download dependencies for the provider 
}

# Create a security group for the EC2 instance
resource "aws_security_group" "app_instance_sg" {
  # Name for the security group
  name        = var.aws_instance_sg_name
  description = var.aws_instance_sg_name

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

# Which service / resource
# "app_instance" is how we refer to the instance in main.tf
resource "aws_instance" "app_instance" {
  # Which AMI to use?
  ami = var.base_ubuntu_22_ami_id

  # What type of instance to use?
  instance_type = var.aws_instance_type

  # Do we need a public IP?
  associate_public_ip_address = true

  # Associate the security group with the instance
  vpc_security_group_ids = [aws_security_group.app_instance_sg.id]


  # Name the resource (in AWS)
  tags = {
    Name = var.aws_instance_name
  }
}