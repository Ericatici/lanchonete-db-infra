provider "aws" {
  region = "us-east-1" # Altere para sua região
}

resource "aws_db_instance" "lanchonete_db" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "15.3"
  instance_class       = "db.t3.micro"
  name                 = "lanchonetedb"
  username             = "admin"
  password             = "Password123!" # Em produção, use Secrets
  skip_final_snapshot  = true
}
