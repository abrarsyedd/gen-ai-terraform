

module "keypair_9baa63" {
  source                  = "./modules/keypair_9baa63"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-9baa63"
}

module "ec2_instance_9baa63" {
  source                  = "./modules/ec2_9baa63"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-9baa63"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_9baa63.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

output "ec2_instance_id_9baa63" { value = module.ec2_instance_9baa63.instance_id }
output "ec2_public_ip_9baa63"    { value = module.ec2_instance_9baa63.public_ip }
output "ec2_private_ip_9baa63"   { value = module.ec2_instance_9baa63.private_ip }


provider "aws" {
  region = "us-east-1"
}

module "keypair_56c2fe" {
  source                  = "./modules/keypair_56c2fe"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-56c2fe"
}

module "ec2_instance_56c2fe" {
  source                  = "./modules/ec2_56c2fe"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-56c2fe"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_56c2fe.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

output "ec2_instance_id_56c2fe" { value = module.ec2_instance_56c2fe.instance_id }
output "ec2_public_ip_56c2fe"    { value = module.ec2_instance_56c2fe.public_ip }
output "ec2_private_ip_56c2fe"   { value = module.ec2_instance_56c2fe.private_ip }
