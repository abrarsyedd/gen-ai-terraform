provider "aws" {
  region = "us-east-1"
}

module "keypair_370929" {
  source                  = "./modules/keypair_370929"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-370929"
}

module "ec2_instance_370929" {
  source                  = "./modules/ec2_370929"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-370929"
  instance_type           = "t2.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_370929.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

output "ec2_instance_id_370929" { value = module.ec2_instance_370929.instance_id }
output "ec2_public_ip_370929"     { value = module.ec2_instance_370929.public_ip }
output "ec2_private_ip_370929"    { value = module.ec2_instance_370929.private_ip }
