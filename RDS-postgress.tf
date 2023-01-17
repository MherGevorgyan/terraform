resource "aws_db_subnet_group" "postrges_subnet_group" {
  name       = "postrges_subnet_group"
  subnet_ids  = [aws_subnet.public_1.id, aws_subnet.public_2.id]
}



resource "aws_db_instance" "test-dev" {
  allocated_storage     = 20
  max_allocated_storage = 50
  backup_retention_period  = 3   # in days
  identifier           = "test-dev"
  engine               = "postgres"
  engine_version       = "14.5"
  instance_class       = "db.t4g.micro"
  port                 =  5432
  username             = "user"
  password             = ""
  publicly_accessible  = true
  storage_type         = "gp2"
  db_subnet_group_name   = aws_db_subnet_group.postrges_subnet_group.name
  vpc_security_group_ids = [aws_security_group.postgres-security-group.id]
  multi_az             = false
  deletion_protection  = true
  skip_final_snapshot  = true
}