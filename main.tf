

provider "aws" {
  region = "us-east-1"
}

module "ec2_instance_fa4037" {
  source                  = "./modules/ec2_fa4037"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-fa4037"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_fa4037.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

module "ec2_instance_faf964" {
  source                  = "./modules/ec2_faf964"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-faf964"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_faf964.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

module "keypair_fa4037" {
  source                  = "./modules/keypair_fa4037"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-fa4037"
}

module "keypair_faf964" {
  source                  = "./modules/keypair_faf964"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-faf964"
}

output "ec2_instance_id_fa4037" { value = module.ec2_instance_fa4037.instance_id }

output "ec2_instance_id_faf964" { value = module.ec2_instance_faf964.instance_id }

output "ec2_private_ip_fa4037"   { value = module.ec2_instance_fa4037.private_ip }

output "ec2_private_ip_faf964"   { value = module.ec2_instance_faf964.private_ip }

output "ec2_public_ip_fa4037"     { value = module.ec2_instance_fa4037.public_ip }

output "ec2_public_ip_faf964"     { value = module.ec2_instance_faf964.public_ip }
