

provider "aws" {
  region = "us-east-1"
}

module "keypair_dab5d6" {
  source                  = "./modules/keypair_dab5d6"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-dab5d6"
}

module "ec2_instance_dab5d6" {
  source                  = "./modules/ec2_dab5d6"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-dab5d6"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_dab5d6.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

output "ec2_instance_id_dab5d6" { value = module.ec2_instance_dab5d6.instance_id }
output "ec2_public_ip_dab5d6"    { value = module.ec2_instance_dab5d6.public_ip }
output "ec2_private_ip_dab5d6"   { value = module.ec2_instance_dab5d6.private_ip }
