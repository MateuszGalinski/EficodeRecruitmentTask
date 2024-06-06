variable "region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami" {
  default = "ami-00beae93a2d981137"
}

variable "key_name" {
  description = "Name of the SSH key pair"
}
