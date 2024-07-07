variable "app_name" {
  description = "Application name"
  type        = string
}

variable "environment_name" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}



variable "availability_zones" {
  description = "Centralized availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}



variable "vpc_cidr" {}


variable "subnets-public" {
  description = "Subnets Configuration"
  type = map(object({
    cidr = string
  }))
  default = {
    "subnets-public1" = { cidr = "10.1.0.0/24" },
    "subnets-public2" = { cidr = "10.1.10.0/24" }
  }
}

variable "subnets-private" {
  description = "Subnets Configuration"
  type = map(object({
    cidr = string
  }))
  default = {
    "subnets-private1" = { cidr = "10.1.20.0/24" },
    "subnets-private2" = { cidr = "10.1.30.0/24" }
  }
}


variable "main_securitygroup_ingress" {
  description = "Ingress rules for main security group"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "main_securitygroup_egress" {
  description = "Egress rules for main security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "main_load_balancer_sg_ingress" {
  description = "Ingress rules for load balancer security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
}

variable "main_load_balancer_sg_egress" {
  description = "Egress rules for load balancer security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}


# variable "iam_policy_properties" {
#   description = "IAM Policy Configuration"
#   type = object({
#     policy_arn = string
#   })
# }



variable "instances" {
  description = "Map of instance configurations"
  type = map(object({
    ami_id        = string
    instance_type = string
    subnet_index  = number
    key_name      = string
    sg_ingress    = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
    sg_egress = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
  }))
}

variable "db_properties" {
  description = "Subnets Configuration"
  type = map(object({
    allocated_storage   = number
    instance_class      = string
    engine              = string
    username            = string
    password            = string
    skip_final_snapshot = bool

  }))
  default = {
    "db1" = { allocated_storage = 30, instance_class = "db.t3.micro", engine = "mysql", username = "dbadmin", password = "attaatta", skip_final_snapshot = true }
  }
}

variable "public_access" {}

variable "alb_properties" {
  description = "Application Load Balancer Configuration"
  type = object({
    internal = bool
  })
}

variable "target_group_properties" {
  description = "Load Balancer Target Group Configuration"
  type = object({
    port     = number
    protocol = string
    health_check = object({
      healthy_threshold   = string
      interval            = string
      protocol            = string
      matcher             = string
      timeout             = string
      path                = string
      unhealthy_threshold = string
    })
  })
}

# variable "vpc_id" {}

# variable "subnet_public" {
#   type = list(string)
# }


# variable "main_load_balancer_sg_ingress" {
#   description = "Ingress rules for load balancer security group"
#   type = list(object({
#     from_port   = number
#     to_port     = number
#     protocol    = string
#     cidr_blocks = list(string)
#     description = string
#   }))
# }

# variable "main_load_balancer_sg_egress" {
#   description = "Egress rules for load balancer security group"
#   type = list(object({
#     from_port   = number
#     to_port     = number
#     protocol    = string
#     cidr_blocks = list(string)
#   }))
# }

variable "listeners" {
  description = "Listeners Configuration"
  type = list(object({
    port     = number
    protocol = string
  }))
  default = [
    {
      port     = 80,
      protocol = "HTTP"
    }
    # {
    #   port     = 443,
    #   protocol = "HTTPS"
    # }
  ]
}

variable "ec2_instance_ids" {
  description = "IDs of the EC2 instances"
  type        = list(string)
}

variable "ec2_instance_properties" {
  description = "Properties for EC2 instances"
  type = list(object({
    path_pattern = string
  }))
}

variable "certificate_arn" {
  description = "ARN of the SSL certificate for HTTPS listener"
  type        = string
}
