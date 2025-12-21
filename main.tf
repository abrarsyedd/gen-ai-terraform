

provider "aws" {
  region = "us-east-1"
}

module "keypair_82c58f" {
  source                  = "./modules/keypair_82c58f"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-82c58f"
}

module "ec2_instance_82c58f" {
  source                  = "./modules/ec2_82c58f"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-82c58f"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_82c58f.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

output "ec2_instance_id_82c58f" { value = module.ec2_instance_82c58f.instance_id }
output "ec2_public_ip_82c58f"    { value = module.ec2_instance_82c58f.public_ip }
output "ec2_private_ip_82c58f"   { value = module.ec2_instance_82c58f.private_ip }
