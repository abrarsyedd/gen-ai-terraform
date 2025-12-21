

provider "aws" {
  region = "us-east-1"
}

module "keypair_d1c783" {
  source                  = "./modules/keypair_d1c783"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-d1c783"
}

module "ec2_instance_d1c783" {
  source                  = "./modules/ec2_d1c783"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-d1c783"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_d1c783.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

output "ec2_instance_id_d1c783" { value = module.ec2_instance_d1c783.instance_id }
output "ec2_public_ip_d1c783"    { value = module.ec2_instance_d1c783.public_ip }
output "ec2_private_ip_d1c783"   { value = module.ec2_instance_d1c783.private_ip }
