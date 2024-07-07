module "vpc" {
  source                     = "../modules/vpc"
  vpc_cidr                   = var.vpc_cidr
  subnets-public             = var.subnets-public
  subnets-private            = var.subnets-private
  availability_zones = data.aws_availability_zones.available.names
  app_name                   = var.app_name
  environment_name           = var.environment_name
  main_securitygroup_egress  = var.main_securitygroup_egress
  main_securitygroup_ingress = var.main_securitygroup_ingress
}


# module "loadbalancer" {
#   source                        = "../modules/loadbalancer"
#   vpc_id                        = module.vpc.vpc_id
#   subnet_public                 = module.vpc.subnet_public
#   alb_properties                = var.alb_properties
#   target_group_properties       = var.target_group_properties
#   app_name                      = var.app_name
#   environment_name              = var.environment_name
#   main_load_balancer_sg_egress  = var.main_load_balancer_sg_egress
#   main_load_balancer_sg_ingress = var.main_load_balancer_sg_ingress
#   listeners = var.listeners
#   ec2_instance_ids              = module.ec2-instances.instance_ids
#   ec2_instance_properties       = var.ec2_instance_properties

#   depends_on       = [module.vpc]

# }



# module "iam" {
#   source                = "../modules/iam"
#   iam_policy_properties = var.iam_policy_properties
#   app_name              = var.app_name
#   environment_name      = var.environment_name

# }


module "database" {
  source           = "../modules/database"
  db_properties    = var.db_properties
  vpc_id           = module.vpc.vpc_id
  subnet_private        = module.vpc.subnet_private
  vpc_sec_grp      = [module.vpc.vpc_sec_grp]
  public_access    = var.public_access
  app_name         = var.app_name
  environment_name = var.environment_name

  depends_on       = [module.vpc]
}

module "ec2-instances" {
  source              = "../modules/ec2-instances"
  vpc_id              = module.vpc.vpc_id
  subnet_public       = module.vpc.subnet_public
  app_name            = var.app_name
  environment_name    = var.environment_name
  instances           = var.instances

  depends_on = [module.vpc]
}