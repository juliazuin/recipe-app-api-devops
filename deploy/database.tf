resource "aws_db_subnet_group" "main" {
  name = "${local.prefix}-main"
  subnet_ids = [
    aws_subnet.private_a.id,
    aws_subnet.private_b.id
  ]

  tags = merge(
    local.common_tags,
    tomap({ "Name" : "${local.prefix}-db-main" })
  )
}

resource "aws_security_group" "rds" {
  description = "Allow access to the RDS database instance"
  name        = "${local.prefix}-rds-inbound-access"
  vpc_id      = aws_vpc.main.id

  ingress = [{
    description      = "Allow access to the RDS database instance"
    protocol         = "tcp"
    from_port        = 5432
    to_port          = 5432
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids  = ["0.0.0.0/0"]
    security_groups  = ["sg-0ba4907aaf439aa87"]
    self             = false
  }]

  tags = local.common_tags
}


resource "aws_db_instance" "main" {
  identifier              = "${local.prefix}-db"
  db_name                    = "recipe"
  allocated_storage       = 20
  storage_type            = "gp2"
  engine                  = "postgres"
  engine_version          = "11.15"
  instance_class          = "db.t2.micro"
  db_subnet_group_name    = aws_db_subnet_group.main.name
  password                = var.db_password
  username                = var.db_username
  backup_retention_period = 0
  multi_az                = false
  skip_final_snapshot     = true
  vpc_security_group_ids  = [aws_security_group.rds.id]

  tags = merge(
    local.common_tags,
    tomap({ "Name" : "${local.prefix}-main" })
  )
}
