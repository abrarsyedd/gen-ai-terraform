

provider "aws" {
  region = "us-east-1"
}

module "keypair_774bba" {
  source                  = "./modules/keypair_774bba"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-774bba"
}

module "ec2_instance_774bba" {
  source                  = "./modules/ec2_774bba"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-774bba"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_774bba.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

output "ec2_instance_id_774bba" { value = module.ec2_instance_774bba.instance_id }
output "ec2_public_ip_774bba"     { value = module.ec2_instance_774bba.public_ip }
output "ec2_private_ip_774bba"   { value = module.ec2_instance_774bba.private_ip }
