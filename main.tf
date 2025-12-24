

module "keypair_04bb87" {
  source                  = "./modules/keypair_04bb87"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-04bb87"
}

module "ec2_instance_04bb87" {
  source                  = "./modules/ec2_04bb87"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-04bb87"
  instance_type           = "t2.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_04bb87.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

output "ec2_instance_id_04bb87" { value = module.ec2_instance_04bb87.instance_id }
output "ec2_public_ip_04bb87"     { value = module.ec2_instance_04bb87.public_ip }
output "ec2_private_ip_04bb87"    { value = module.ec2_instance_04bb87.private_ip }


provider "aws" {
  region = "us-east-1"
}

module "keypair_002b88" {
  source                  = "./modules/keypair_002b88"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-002b88"
}

module "ec2_instance_002b88" {
  source                  = "./modules/ec2_002b88"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-002b88"
  instance_type           = "t2.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_002b88.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

output "ec2_instance_id_002b88" { value = module.ec2_instance_002b88.instance_id }
output "ec2_public_ip_002b88"     { value = module.ec2_instance_002b88.public_ip }
output "ec2_private_ip_002b88"    { value = module.ec2_instance_002b88.private_ip }
