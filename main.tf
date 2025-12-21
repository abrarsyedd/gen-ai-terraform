

module "keypair_ee14fa" {
  source                  = "./modules/keypair_ee14fa"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-ee14fa"
}

module "ec2_instance_ee14fa" {
  source                  = "./modules/ec2_ee14fa"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-ee14fa"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_ee14fa.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

output "ec2_instance_id_ee14fa" { value = module.ec2_instance_ee14fa.instance_id }
output "ec2_public_ip_ee14fa"    { value = module.ec2_instance_ee14fa.public_ip }
output "ec2_private_ip_ee14fa"   { value = module.ec2_instance_ee14fa.private_ip }


module "keypair_376cc4" {
  source                  = "./modules/keypair_376cc4"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-376cc4"
}

module "ec2_instance_376cc4" {
  source                  = "./modules/ec2_376cc4"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-376cc4"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_376cc4.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

output "ec2_instance_id_376cc4" { value = module.ec2_instance_376cc4.instance_id }
output "ec2_public_ip_376cc4"    { value = module.ec2_instance_376cc4.public_ip }
output "ec2_private_ip_376cc4"   { value = module.ec2_instance_376cc4.private_ip }


provider "aws" {
  region = "us-east-1"
}

module "keypair_9c0708" {
  source                  = "./modules/keypair_9c0708"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-9c0708"
}

module "ec2_instance_9c0708" {
  source                  = "./modules/ec2_9c0708"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-9c0708"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_9c0708.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

output "ec2_instance_id_9c0708" { value = module.ec2_instance_9c0708.instance_id }
output "ec2_public_ip_9c0708"    { value = module.ec2_instance_9c0708.public_ip }
output "ec2_private_ip_9c0708"   { value = module.ec2_instance_9c0708.private_ip }
