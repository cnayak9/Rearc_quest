resource "aws_vpc" "rearc" {
  cidr_block = "11.0.0.0/16"
  tags = {
    "Name" = "rearc-vpc"
  }

}