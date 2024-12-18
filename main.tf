# Specify the provider (AWS)
provider "aws" {
  region = "eu-west-1"  # Update to your desired region
}

# Create a security group to allow SSH access (port 22)
resource "aws_security_group" "allow_ssh" {
  name_prefix = "allow-ssh-"
  description = "Allow SSH inbound traffic"

  # Inbound rule to allow SSH (port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Open to all IP addresses (for demo purposes)
  }

  # Outbound rule allowing all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



# Create an EC2 instance
resource "aws_instance" "example" {
  ami             = "ami-0a094c309b87cc107"  # Amazon Linux 2 AMI (update to your region's latest AMI)
  instance_type   = "t2.micro"                # Instance type
  security_groups = [aws_security_group.allow_ssh.name]

  # Optional: Add a Name tag
  tags = {
    Name = "MyEC2Instance"
  }

  # Optional: Specify the availability zone
  availability_zone = "eu-west-1a"  # Update to the availability zone you want
}

# Output the public IP of the EC2 instance
output "instance_public_ip" {
  value = aws_instance.example.public_ip
}
