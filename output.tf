output "vpc_id" {

    value = aws_vpc.terraform-vpc.id
}


output "subnet_id" {

    value = aws_subnet.terraform-subnet.id
}
