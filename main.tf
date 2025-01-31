provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "terraform-vpc" {
  #cidr_block       = "10.0.0.0/16"
  cidr_block = var.vpc-cidr-block
  tags = {
    Name = "vpc-TF"
  }
}

resource "aws_subnet" "terraform-subnet" {
  vpc_id     = aws_vpc.terraform-vpc.id
  #cidr_block = "10.0.1.0/24"
  cidr_block = var.subnet-cidr
  availability_zone = var.az
  map_public_ip_on_launch = "true"

  tags = {
    Name = "vpc-subnet"
  }
}

resource "aws_internet_gateway" "terraform-Igw" {
  vpc_id = aws_vpc.terraform-vpc.id

  tags = {
    Name = "terraform-Igw"
  }
}

resource "aws_route_table" "terraform-RT" {
  vpc_id = aws_vpc.terraform-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform-Igw.id
  }

  
  tags = {
    Name = "terraform-RT"
  }
}
