# creating vpc for us and ap regions
module "vpc_us" {
  source     = "./modules/vpc"
  name       = var.vpc_us_name
  cidr_block = var.vpc_cidr_us
}

module "vpc_ap" {
  source     = "./modules/vpc"
  name       = var.vpc_ap_name
  cidr_block = var.vpc_cidr_ap
  providers = {
    aws = aws.ap
  }
}


# Creating Subnets for VPC US 
module "vpc_us_subnets" {
  source              = "./modules/subnets"
  vpc_id              = module.vpc_us.vpc_id
  vpc_azs             = var.vpc_us_azs
  vpc_igw_id          = module.vpc_us.vpc_igw_id
  vpc_name            = var.vpc_us_name
  public_subnet_cidr  = var.us_public_subnet_cidr
  private_subnet_cidr = var.us_private_subnet_cidr
  db_subnet_cidr      = var.us_db_subnet_cidr
}

# Creating Subnets for VPC AP
module "vpc_ap_subnets" {
  source              = "./modules/subnets"
  vpc_id              = module.vpc_ap.vpc_id
  vpc_azs             = var.vpc_ap_azs
  vpc_igw_id          = module.vpc_ap.vpc_igw_id
  vpc_name            = var.vpc_ap_name
  public_subnet_cidr  = var.ap_public_subnet_cidr
  private_subnet_cidr = var.ap_private_subnet_cidr
  db_subnet_cidr      = var.ap_db_subnet_cidr

  providers = {
    aws = aws.ap
  }
}

# Creating NAT GW for VPC US
module "vpc_us_nat_gw" {
  source             = "./modules/nat"
  vpc_id             = module.vpc_us.vpc_id
  vpc_name           = var.vpc_us_name
  public_subnet_ids  = module.vpc_us_subnets.public_subnet_ids
  private_subnet_ids = module.vpc_us_subnets.private_subnet_ids
  depends_on         = [module.vpc_us_subnets]
}

# Creating NAT GW for VPC AP
module "vpc_ap_nat_gw" {
  source             = "./modules/nat"
  vpc_id             = module.vpc_ap.vpc_id
  vpc_name           = var.vpc_ap_name
  public_subnet_ids  = module.vpc_ap_subnets.public_subnet_ids
  private_subnet_ids = module.vpc_ap_subnets.private_subnet_ids
  depends_on         = [module.vpc_ap_subnets]

  providers = {
    aws = aws.ap
  }
}
