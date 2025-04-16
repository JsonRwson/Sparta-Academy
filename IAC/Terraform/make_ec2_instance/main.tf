# Where to make the infrastructure (what cloud provider)
provider "aws" {
  # which region to use
  region = "eu-west-1"

  # Running "terraform init" will download dependencies for the provider 
}

# Create a security group for the EC2 instance
resource "aws_security_group" "app_instance_sg" {
  # Name for the security group
  name        = "tech503-jason-TF-SG"
  description = "Allow HTTP and SSH traffic"

  # Inbound rule for HTTP (port 80)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Inbound rule for SSH (port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # "Egress" is used for outbound rules
}

# Which service / resource
# "app_instance" is how we refer to the instance in main.tf
resource "aws_instance" "app_instance" {
  # Which AMI to use?
  ami = "ami-0f0c3baa60262d5b9"

  # What type of instance to use?
  instance_type = "t2.micro"

  # Do we need a public IP?
  associate_public_ip_address = true

  # Associate the security group with the instance
  vpc_security_group_ids = [aws_security_group.app_instance_sg.id]

  # Name the resource (in AWS)
  tags = {
    Name = "tech503-jason-terraform-instance"
  }
}