resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.0.0/20"
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true


  tags = {
    Name                                       = "simu_pub_1_us-east-2a"
    "kubernetes.io/cluster/test_dev_eks" = "shared"
    "kubernetes.io/role/elb"                   = 1
  }
}

resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.16.0/20"
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = true


  tags = {
    Name                                       = "simu_pub_2_us-east-2b"
    "kubernetes.io/cluster/test_dev_eks" = "shared"
    "kubernetes.io/role/elb"                   = 1
  }
}

resource "aws_subnet" "private_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.32.0/20"
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true


  tags = {
    Name                                       = "simu_priv_1_us-east-2a"
    "kubernetes.io/cluster/test_dev_eks" = "shared"
    "kubernetes.io/role/internal-elb"          = 1
  }
}

resource "aws_subnet" "private_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.48.0/20"
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = true


  tags = {
    Name                                       = "simu_priv_2_us-east-2b"
    "kubernetes.io/cluster/test_dev_eks" = "shared"
    "kubernetes.io/role/internal-elb"          = 1
  }
}