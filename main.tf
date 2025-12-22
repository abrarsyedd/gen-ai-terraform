

module "keypair_399f8f" {
  source                  = "./modules/keypair_399f8f"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-399f8f"
}

module "ec2_instance_399f8f" {
  source                  = "./modules/ec2_399f8f"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-399f8f"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_399f8f.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

output "ec2_instance_id_399f8f" { value = module.ec2_instance_399f8f.instance_id }
output "ec2_public_ip_399f8f"    { value = module.ec2_instance_399f8f.public_ip }
output "ec2_private_ip_399f8f"   { value = module.ec2_instance_399f8f.private_ip }


provider "aws" {
  region = "us-east-1"
}

module "keypair_eec1d9" {
  source                  = "./modules/keypair_eec1d9"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-eec1d9"
}

module "ec2_instance_eec1d9" {
  source                  = "./modules/ec2_eec1d9"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-eec1d9"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_eec1d9.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

output "ec2_instance_id_eec1d9" { value = module.ec2_instance_eec1d9.instance_id }
output "ec2_public_ip_eec1d9"    { value = module.ec2_instance_eec1d9.public_ip }
output "ec2_private_ip_eec1d9"   { value = module.ec2_instance_eec1d9.private_ip }
