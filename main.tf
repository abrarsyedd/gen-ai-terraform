

provider "aws" {
  region = "us-east-1"
}

module "ec2_instance_45f0f9" {
  source                  = "./modules/ec2_45f0f9"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-45f0f9"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_45f0f9.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

module "ec2_instance_876710" {
  source                  = "./modules/ec2_876710"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-876710"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_876710.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

module "keypair_45f0f9" {
  source                  = "./modules/keypair_45f0f9"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-45f0f9"
}

module "keypair_876710" {
  source                  = "./modules/keypair_876710"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-876710"
}

output "ec2_instance_id_45f0f9" { value = module.ec2_instance_45f0f9.instance_id }

output "ec2_instance_id_876710" { value = module.ec2_instance_876710.instance_id }

output "ec2_private_ip_45f0f9"   { value = module.ec2_instance_45f0f9.private_ip }

output "ec2_private_ip_876710"   { value = module.ec2_instance_876710.private_ip }

output "ec2_public_ip_45f0f9"    { value = module.ec2_instance_45f0f9.public_ip }

output "ec2_public_ip_876710"    { value = module.ec2_instance_876710.public_ip }
