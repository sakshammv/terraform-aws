module "networking" {
  source    = "./modules/networking"
  namespace = var.namespace
}

module "ssh-key" {
  source    = "./modules/ssh-key"
  namespace = var.namespace
}

module "ec2" {
  source     = "./modules/ec2"
  namespace  = var.namespace
  vpc        = module.networking.vpc
  sg_pub_id  = module.networking.sg_pub_id
  sg_priv_id = module.networking.sg_priv_id
  key_name   = module.ssh-key.key_name
}

#OUTPUT#
output "public_connection_string" {
  description = "Copy/Paste/Enter - You are in the matrix"
  value       = "ssh -i ${module.ssh-key.key_name}.pem ec2-user@${module.ec2.public_ip}"
}

output "private_connection_string" {
  description = "Copy/Paste/Enter - You are in the private ec2 instance"
  value       = "ssh -i ${module.ssh-key.key_name}.pem ec2-user@${module.ec2.private_ip}"
}

#VARIABLES#

variable "namespace" {
  description = "TF aws"
  default     = "tfaws"
  type        = string
}

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
  type        = string
}

#PROVIDER#

provider "aws" {
    access_key = "AKIA2X2TR3V372MREDND"
    secret_key = "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"
    region = "us-east-1"
}
