terraform {
  backend "s3" {
    bucket         = "devops-alon-tfstate-123456"
    key            = "global/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }

  required_version = ">= 1.6.0"
}


