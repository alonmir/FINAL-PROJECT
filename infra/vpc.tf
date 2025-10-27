module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "devops-alon-vpc"
  cidr = "10.0.0.0/16"

  azs            = ["eu-central-1a", "eu-central-1b"]
  public_subnets = ["10.0.1.0/24", "10.0.3.0/24"]


  create_igw              = true
  enable_nat_gateway      = false
  single_nat_gateway      = false
  map_public_ip_on_launch = true

}


