resource "aws_route_table" "pub-rearc-rt" {
  vpc_id = aws_vpc.rearc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.rearc-igw.id
  }
  tags = {
    "Name" = "pub-rearc-rt"
  }

}
resource "aws_route_table_association" "pub-sub-rearc-1" {
  subnet_id      = aws_subnet.pub-sub-1.id
  route_table_id = aws_route_table.pub-rearc-rt.id

}
resource "aws_route_table_association" "pub-sub-rearc-2" {
  subnet_id      = aws_subnet.pub-sub-2.id
  route_table_id = aws_route_table.pub-rearc-rt.id

}