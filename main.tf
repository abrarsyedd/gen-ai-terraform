

provider "aws" {
  region = "us-east-1"
}

module "keypair_e90d66" {
  source                  = "./modules/keypair_e90d66"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-e90d66"
}

module "ec2_instance_e90d66" {
  source                  = "./modules/ec2_e90d66"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-e90d66"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_e90d66.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

output "ec2_instance_id_e90d66" { value = module.ec2_instance_e90d66.instance_id }
output "ec2_public_ip_e90d66"     { value = module.ec2_instance_e90d66.public_ip }
output "ec2_private_ip_e90d66"   { value = module.ec2_instance_e90d66.private_ip }
