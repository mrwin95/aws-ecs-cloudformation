provider "aws" {
  
}

resource "aws_ecr_repository" "ecr" {
  name = "ecr-repository"

  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }
}