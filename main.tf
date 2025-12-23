

module "keypair_90636b" {
  source                  = "./modules/keypair_90636b"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-90636b"
}

module "ec2_instance_90636b" {
  source                  = "./modules/ec2_90636b"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-90636b"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_90636b.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

output "ec2_instance_id_90636b" { value = module.ec2_instance_90636b.instance_id }
output "ec2_public_ip_90636b"     { value = module.ec2_instance_90636b.public_ip }
output "ec2_private_ip_90636b"    { value = module.ec2_instance_90636b.private_ip }


provider "aws" {
  region = "us-east-1"
}

module "keypair_59d7a7" {
  source                  = "./modules/keypair_59d7a7"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-59d7a7"
}

module "ec2_instance_59d7a7" {
  source                  = "./modules/ec2_59d7a7"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-59d7a7"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_59d7a7.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

output "ec2_instance_id_59d7a7" { value = module.ec2_instance_59d7a7.instance_id }
output "ec2_public_ip_59d7a7"     { value = module.ec2_instance_59d7a7.public_ip }
output "ec2_private_ip_59d7a7"    { value = module.ec2_instance_59d7a7.private_ip }
