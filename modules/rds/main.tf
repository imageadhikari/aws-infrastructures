resource "aws_security_group" "example" {
  name_prefix = "rds-db"
  vpc_id = var.vpc_id
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_groups = [var.security_group]
  }
  # egress {
  #   from_port = 0
  #   to_port = 0
  #   protocol = "-1"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name = "trial_db_subnet_group"
  description = "DB subnet group for tutorial"
  # subnet_ids = [given_subnet_id[0]]
  subnet_ids = [for id in var.given_subnet_id : id]
  
}

resource "aws_db_instance" "default" {
  allocated_storage    = var.storage
  db_name              = "mydb"
  engine               = var.engine
  engine_version       = var.engine-version
  instance_class       = var.instance_class
  username             = "imageadhikari"
  password             = "image123"
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.example.id]
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.id
}