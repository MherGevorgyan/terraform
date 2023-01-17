resource "aws_iam_role" "test_dev_node" {
  name = "test_dev_node"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}


resource "aws_iam_role_policy_attachment" "test_dev_node-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.test_dev_node.name
}

resource "aws_iam_role_policy_attachment" "test_dev_node-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.test_dev_node.name
}

resource "aws_iam_role_policy_attachment" "test_dev_node-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.test_dev_node.name

}

resource "aws_eks_node_group" "test_dev_node" {
  cluster_name    = aws_eks_cluster.test_dev_eks.name
  node_group_name = "test_dev_node"
  node_role_arn   = aws_iam_role.test_dev_node.arn
  subnet_ids = [
    aws_subnet.private_2.id
  ]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  ami_type             = "AL2_x86_64"
  capacity_type        = "ON_DEMAND"
  disk_size            = 20
  force_update_version = false
  instance_types       = ["t3.xlarge"]
  labels = {
    role = "test_dev_node"
  }

  # version = "1.23"

  depends_on = [

    aws_iam_role_policy_attachment.test_dev_node-AmazonEKSWorkerNodePolicy,

    aws_iam_role_policy_attachment.test_dev_node-AmazonEKS_CNI_Policy,

    aws_iam_role_policy_attachment.test_dev_node-AmazonEC2ContainerRegistryReadOnly,
  ]
}