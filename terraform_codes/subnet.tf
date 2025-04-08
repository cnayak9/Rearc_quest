resource "aws_subnet" "pub-sub-1" {
  vpc_id            = aws_vpc.rearc.id
  cidr_block        = "11.0.0.0/24"
  availability_zone = "us-east-1a"
  tags = {
    "Name" = "pub-sub-rearc-1"
  }
}
resource "aws_subnet" "pub-sub-2" {
  vpc_id            = aws_vpc.rearc.id
  cidr_block        = "11.0.1.0/24"
  availability_zone = "us-east-1b"
  tags = {
    "Name" = "pub-sub-rearc-2"
  }

}