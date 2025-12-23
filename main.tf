

provider "aws" {
  region = "us-east-1"
}

module "keypair_38d4ea" {
  source                  = "./modules/keypair_38d4ea"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-38d4ea"
}

module "ec2_instance_38d4ea" {
  source                  = "./modules/ec2_38d4ea"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-38d4ea"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_38d4ea.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

output "ec2_instance_id_38d4ea" { value = module.ec2_instance_38d4ea.instance_id }
output "ec2_public_ip_38d4ea"     { value = module.ec2_instance_38d4ea.public_ip }
output "ec2_private_ip_38d4ea"    { value = module.ec2_instance_38d4ea.private_ip }
