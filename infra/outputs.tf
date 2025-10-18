output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.vpc.public_subnets
}
output "ecr_repository_url" {
  value = aws_ecr_repository.app.repository_url
}


