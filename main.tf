

provider "aws" {
  region = "us-east-1"
}

module "keypair_550247" {
  source                  = "./modules/keypair_550247"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-550247"
}

module "ec2_instance_550247" {
  source                  = "./modules/ec2_550247"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-550247"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_550247.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

output "ec2_instance_id_550247" { value = module.ec2_instance_550247.instance_id }
output "ec2_public_ip_550247"     { value = module.ec2_instance_550247.public_ip }
output "ec2_private_ip_550247"    { value = module.ec2_instance_550247.private_ip }
