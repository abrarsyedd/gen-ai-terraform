

provider "aws" {
  region = "us-east-1"
}

module "ec2_instance_77c712" {
  source                  = "./modules/ec2_77c712"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-77c712"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_77c712.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

module "ec2_instance_9bcac6" {
  source                  = "./modules/ec2_9bcac6"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-9bcac6"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_9bcac6.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

module "ec2_instance_a2024e" {
  source                  = "./modules/ec2_a2024e"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-a2024e"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_a2024e.key_name
}

module "ec2_instance_d6c33c" {
  source                  = "./modules/ec2_d6c33c"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-d6c33c"
  instance_type           = "t2.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_d6c33c.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

module "keypair_77c712" {
  source                  = "./modules/keypair_77c712"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-77c712"
}

module "keypair_9bcac6" {
  source                  = "./modules/keypair_9bcac6"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-9bcac6"
}

module "keypair_a2024e" {
  source                  = "./modules/keypair_a2024e"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-a2024e"
}

module "keypair_d6c33c" {
  source                  = "./modules/keypair_d6c33c"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-d6c33c"
}

output "ec2_instance_id_77c712" { value = module.ec2_instance_77c712.instance_id }

output "ec2_instance_id_9bcac6" { value = module.ec2_instance_9bcac6.instance_id }

output "ec2_instance_id_a2024e" { value = module.ec2_instance_a2024e.instance_id }

output "ec2_instance_id_d6c33c" { value = module.ec2_instance_d6c33c.instance_id }

output "ec2_private_ip_77c712"    { value = module.ec2_instance_77c712.private_ip }

output "ec2_private_ip_9bcac6"    { value = module.ec2_instance_9bcac6.private_ip }

output "ec2_private_ip_a2024e"    { value = module.ec2_instance_a2024e.private_ip }

output "ec2_private_ip_d6c33c"    { value = module.ec2_instance_d6c33c.private_ip }

output "ec2_public_ip_77c712"     { value = module.ec2_instance_77c712.public_ip }

output "ec2_public_ip_9bcac6"     { value = module.ec2_instance_9bcac6.public_ip }

output "ec2_public_ip_a2024e"     { value = module.ec2_instance_a2024e.public_ip }

output "ec2_public_ip_d6c33c"     { value = module.ec2_instance_d6c33c.public_ip }
