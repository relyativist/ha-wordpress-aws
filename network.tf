resource "aws_internet_gateway" "base-nat-gateway" {
    vpc_id = aws_vpc.base-vpc.id
    tags = {
        Name = "base-gw-nat"
    }
}

#route table
resource "aws_route_table" "route-gw" {
    vpc_id = aws_vpc.base-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.base-nat-gateway.id
    }
    tags = {
        Name = "base-route-gw"
    }
}

#create association between route table and public subnet
resource "aws_route_table_association" "pvsubnet" {
    subnet_id      = aws_subnet.base-subnet-public-1.id
    route_table_id = aws_route_table.route-gw.id
}
resource "aws_route_table_association" "pvsubnet-2" {
    subnet_id      = aws_subnet.base-subnet-public-2.id
    route_table_id = aws_route_table.route-gw.id
}

