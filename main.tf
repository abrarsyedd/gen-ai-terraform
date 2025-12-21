

provider "aws" {
  region = "us-east-1"
}

module "keypair_c4733a" {
  source                  = "./modules/keypair_c4733a"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-c4733a"
}

module "ec2_instance_c4733a" {
  source                  = "./modules/ec2_c4733a"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-c4733a"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_c4733a.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

output "ec2_instance_id_c4733a" { value = module.ec2_instance_c4733a.instance_id }
output "ec2_public_ip_c4733a"    { value = module.ec2_instance_c4733a.public_ip }
output "ec2_private_ip_c4733a"   { value = module.ec2_instance_c4733a.private_ip }
