resource "aws_internet_gateway" "inet-gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "simu_inet-gw"
  }
}

