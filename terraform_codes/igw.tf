resource "aws_internet_gateway" "rearc-igw" {
  vpc_id = aws_vpc.rearc.id
  tags = {
    "name" = "rearc-market-igw"
  }

}