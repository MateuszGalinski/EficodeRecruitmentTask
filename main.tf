terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"  
  access_key = "access-key"
  secret_key = "secret-key"
}

resource "aws_key_pair" "key_pair" {
  key_name = "ssh-rsa"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCtNZinGiD0w3ofADcV+V1k6t/2en2M/1h7nxG4biwmI2pyrk/32Lc0Oz3q3olpkz9/Dfa7oHuUCKbjkX1kwLx5AA6Zk3TSqx5efBwhlCnHjB8WTLgwNgg980PvdTvDdQhAJfV+pDrdSOiLgDdchS6HQkCmdEupdMI9qYf+hsgWb5BYyWb89JN04uC8rmhLiLEpIyj5NlOwRRfvqeTb/kLHs+DFrYe6OWRlh/T0UnXfrdfNROjCCuf/9WqitDP+QLS2mQwt8yySImDe061DtkqprfL/+d7lRzdMcM2RCKt41I2co7Tr8sy+ihganPIoZw0nNUeO9ZmirXDb83oWOC8AzvXlIyZHTA58TeO5sIQgQ1cawlXqCpOxlN3gbQNdESlD/+ltFefRNKmQBPaa6g+PDZ4nFlhxkE/CX46SFIxQDoWW3IqmiUj0LWPE3P7BS5nV23kPWroiNuJwYqXfTW9dwabPsV27WUuZiGFfVT8FbnmLpnOhEks+Razd+yiFMh8="
}

resource "aws_instance" "web" {
  ami           = "ami-00beae93a2d981137"  
  instance_type = "t2.micro"
  key_name      = aws_key_pair.key_pair.key_name           

  tags = {
    Name = "RecruitmentApp"
  }

  vpc_security_group_ids = [aws_security_group.instance.id]
  
}

resource "aws_security_group" "instance" {
  name        = "instance"
  description = "Security group for EC2 instance"

  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
