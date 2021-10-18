provider "aws" {
  
}

data "aws_availability_zones" "available-zone" {
  state = "available"
}

resource "aws_vpc" "LabVPC" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true  
  tags = {
    "Name" = "VPC"
  }
}

resource "aws_internet_gateway" "IGW" {
  name = "IGW"
  vpc_id = aws_vpc.LabVPC.id
}