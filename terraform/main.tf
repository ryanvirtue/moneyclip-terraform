module "vpc" {
  source = "./modules/vpc"
  
  app_name    = var.app_name
  environment = var.environment
  aws_region  = var.aws_region
}

module "rds" {
  source = "./modules/rds"
  
  app_name              = var.app_name
  environment          = var.environment
  vpc_id               = module.vpc.vpc_id
  db_password          = var.db_password
  subnet_ids           = module.vpc.private_subnets
  ecs_security_group_id = module.ecs.security_group_id
}

module "ecs" {
  source = "./modules/ecs"
  
  app_name           = var.app_name
  environment        = var.environment
  vpc_id            = module.vpc.vpc_id
  subnet_ids        = module.vpc.private_subnets
  db_host           = module.rds.db_host
  db_password       = var.db_password
  ecr_repository_url = var.ecr_repository_url
  rails_master_key  = var.rails_master_key
}
