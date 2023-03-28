resource "aws_db_instance" "default" {
  allocated_storage    = var.storage
  db_name              = "mydb"
  engine               = var.engine
  engine_version       = var.engine-version
  instance_class       = var.instance_class
  username             = "imageadhikari"
  password             = "image123"
  skip_final_snapshot  = true
}

resource "aws_security_group" "example" {
  name_prefix = "rds-db"
  ingress {
    from_port   = 0
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}