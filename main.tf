

module "keypair_a07f49" {
  source                  = "./modules/keypair_a07f49"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-a07f49"
}

module "ec2_instance_a07f49" {
  source                  = "./modules/ec2_a07f49"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-a07f49"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_a07f49.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

output "ec2_instance_id_a07f49" { value = module.ec2_instance_a07f49.instance_id }
output "ec2_public_ip_a07f49"     { value = module.ec2_instance_a07f49.public_ip }
output "ec2_private_ip_a07f49"    { value = module.ec2_instance_a07f49.private_ip }


provider "aws" {
  region = "us-east-1"
}

module "keypair_ae787c" {
  source                  = "./modules/keypair_ae787c"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-ae787c"
}

module "ec2_instance_ae787c" {
  source                  = "./modules/ec2_ae787c"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-ae787c"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_ae787c.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

output "ec2_instance_id_ae787c" { value = module.ec2_instance_ae787c.instance_id }
output "ec2_public_ip_ae787c"     { value = module.ec2_instance_ae787c.public_ip }
output "ec2_private_ip_ae787c"    { value = module.ec2_instance_ae787c.private_ip }
