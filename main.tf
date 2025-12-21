

provider "aws" {
  region = "us-east-1"
}

module "keypair_93bcba" {
  source                  = "./modules/keypair_93bcba"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-93bcba"
}

module "ec2_instance_93bcba" {
  source                  = "./modules/ec2_93bcba"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-93bcba"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_93bcba.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

output "ec2_instance_id_93bcba" { value = module.ec2_instance_93bcba.instance_id }
output "ec2_public_ip_93bcba"    { value = module.ec2_instance_93bcba.public_ip }
output "ec2_private_ip_93bcba"   { value = module.ec2_instance_93bcba.private_ip }
