############ default routetable ##########

resource "aws_default_route_table" "public_routetable" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "${var.product}.${var.environment}-public_routetable"
  }
}


######### private routetable #########
resource "aws_route_table" "private_routetable" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.product}.${var.environment}-private_routetable"
  }
}


###### associate public subnets to the public routetable ##########
resource "aws_route_table_association" "public_routetable_assoc" {
  count          =          length(split(",",var.publicsubnet_cidr))  
  subnet_id      =          element(aws_subnet.public_subnets.*.id, count.index)
  route_table_id =          element(aws_default_route_table.public_routetable.*.id, count.index)
}


###### associate private subnets to the private routetable ##########sss
resource "aws_route_table_association" "private_routetable_assoc" {
  count          =          length(split(",",var.privatesubnet_cidr))  
  subnet_id      =          element(aws_subnet.private_subnets.*.id, count.index)
  route_table_id =          element(aws_route_table.private_routetable.*.id, count.index)
}


