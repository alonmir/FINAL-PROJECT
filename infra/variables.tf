variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "project_name" {
  type    = string
  default = "devops-alon"
}

variable "my_ip_cidr" {
  description = "Your public IP in CIDR"
  type        = string
}

