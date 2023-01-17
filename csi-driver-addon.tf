resource "aws_eks_addon" "csi_driver" {
  cluster_name             = aws_eks_cluster.test_dev_eks.name
  addon_name               = "aws-ebs-csi-driver"
  addon_version            = "v1.11.4-eksbuild.1"
  service_account_role_arn = aws_iam_role.eks_ebs_csi_driver.arn
}