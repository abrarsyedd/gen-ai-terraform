

module "keypair_c4733a" {
  source                  = "./modules/keypair_c4733a"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-c4733a"
}

module "ec2_instance_c4733a" {
  source                  = "./modules/ec2_c4733a"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-c4733a"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_c4733a.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

output "ec2_instance_id_c4733a" { value = module.ec2_instance_c4733a.instance_id }
output "ec2_public_ip_c4733a"    { value = module.ec2_instance_c4733a.public_ip }
output "ec2_private_ip_c4733a"   { value = module.ec2_instance_c4733a.private_ip }


module "keypair_06f035" {
  source                  = "./modules/keypair_06f035"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-06f035"
}

module "ec2_instance_06f035" {
  source                  = "./modules/ec2_06f035"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-06f035"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_06f035.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

output "ec2_instance_id_06f035" { value = module.ec2_instance_06f035.instance_id }
output "ec2_public_ip_06f035"    { value = module.ec2_instance_06f035.public_ip }
output "ec2_private_ip_06f035"   { value = module.ec2_instance_06f035.private_ip }


provider "aws" {
  region = "us-east-1"
}

module "keypair_5cbe06" {
  source                  = "./modules/keypair_5cbe06"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-5cbe06"
}

module "ec2_instance_5cbe06" {
  source                  = "./modules/ec2_5cbe06"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-5cbe06"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_5cbe06.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

output "ec2_instance_id_5cbe06" { value = module.ec2_instance_5cbe06.instance_id }
output "ec2_public_ip_5cbe06"    { value = module.ec2_instance_5cbe06.public_ip }
output "ec2_private_ip_5cbe06"   { value = module.ec2_instance_5cbe06.private_ip }
