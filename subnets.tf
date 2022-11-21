### public subnets ###
resource "aws_subnet" "public_subnets" {
  count = length(split(",",var.publicsubnet_cidr))  
  vpc_id     = aws_vpc.vpc.id
  cidr_block = element(split(",",var.publicsubnet_cidr), count.index)
  availability_zone = element(split(",",var.public_az), count.index)

  tags = {
            Name = "${var.product}.${var.environment}-public_subnets.${count.index  + 1}" 
  }
}



### private subnets ####
resource "aws_subnet" "private_subnets" {
  count = length(split(",",var.privatesubnet_cidr))
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = element(split(",",var.privatesubnet_cidr), count.index)
  availability_zone = element(split(",",var.private_az), count.index)

  tags = {
    Name = "${var.product}.${var.environment}-private _subnets.${count.index  + 1}" 
  }
}


