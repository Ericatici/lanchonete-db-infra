provider "aws" {
  region = "us-east-2" # Ensure this matches your desired region
}
#
resource "aws_db_instance" "lanchonete_db" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0.39" # Use a compatible MySQL version
  instance_class       = "db.t3.micro"
  db_name              = "lanchonetedb"
  username             = var.db_username
  password             = var.db_password
  skip_final_snapshot  = true
  publicly_accessible  = true # For testing, consider restricting in production
  vpc_security_group_ids = [aws_security_group.lanchonete_db_sg.id]
  db_subnet_group_name = aws_db_subnet_group.lanchonete_db_subnet_group.name
}

resource "aws_security_group" "lanchonete_db_sg" {
  name        = "lanchonete-db-sg"
  description = "Allow access to RDS MySQL instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306 # MySQL default port
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"] # Allow access from entire VPC CIDR block
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "lanchonete_db_subnet_group" {
  name       = "lanchonete-db-subnet-group"
  subnet_ids = var.eks_public_subnet_ids
}
