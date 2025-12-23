

provider "aws" {
  region = "us-east-1"
}

module "keypair_5b1c0e" {
  source                  = "./modules/keypair_5b1c0e"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-5b1c0e"
}

module "ec2_instance_5b1c0e" {
  source                  = "./modules/ec2_5b1c0e"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-5b1c0e"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_5b1c0e.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

output "ec2_instance_id_5b1c0e" { value = module.ec2_instance_5b1c0e.instance_id }
output "ec2_public_ip_5b1c0e"     { value = module.ec2_instance_5b1c0e.public_ip }
output "ec2_private_ip_5b1c0e"    { value = module.ec2_instance_5b1c0e.private_ip }
