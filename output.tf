output "vpc_id" {
  value = aws_vpc.vpc.id
  description = "The ID of the VPC"
}

output "public_subnet" {
 value = aws_subnet.public_subnets.*.id
 description = "The ID of the public subnet"
}

output "private_subnet" {
 value = aws_subnet.private_subnets.*.id
 description = "The ID of the private subnet"
}
