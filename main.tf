provider "aws" {
  region = "us-east-1"
}

module "keypair_681f1e" {
  source                  = "./modules/keypair_681f1e"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-681f1e"
}

module "ec2_instance_681f1e" {
  source                  = "./modules/ec2_681f1e"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-681f1e"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_681f1e.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

module "keypair_fea80d" {
  source                  = "./modules/keypair_fea80d"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-fea80d"
}

module "ec2_instance_fea80d" {
  source                  = "./modules/ec2_fea80d"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-fea80d"
  instance_type           = "t2.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_fea80d.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

output "ec2_instance_id_681f1e" { value = module.ec2_instance_681f1e.instance_id }
output "ec2_public_ip_681f1e"     { value = module.ec2_instance_681f1e.public_ip }
output "ec2_private_ip_681f1e"    { value = module.ec2_instance_681f1e.private_ip }
output "ec2_instance_id_fea80d" { value = module.ec2_instance_fea80d.instance_id }
output "ec2_public_ip_fea80d"     { value = module.ec2_instance_fea80d.public_ip }
output "ec2_private_ip_fea80d"    { value = module.ec2_instance_fea80d.private_ip }
