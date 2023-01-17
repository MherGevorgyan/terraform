resource "aws_ecr_repository" "dev_test_backend" {
  name                 = "dev_test_backend"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}

resource "aws_ecr_repository" "dev_test_frontend" {
  name                 = "dev_test_frontend"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}

