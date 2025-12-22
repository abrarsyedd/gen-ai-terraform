

provider "aws" {
  region = "us-east-1"
}

module "keypair_0c319f" {
  source                  = "./modules/keypair_0c319f"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-keypair-0c319f"
}

module "ec2_instance_0c319f" {
  source                  = "./modules/ec2_0c319f"
  project_name            = "GenAI"
  environment             = "dev"
  name                    = "GenAI-ec2-0c319f"
  instance_type           = "t3.micro"
  subnet_id               = ""
  vpc_subnets             = []
  vpc_security_group_ids  = []
  user_security_groups    = []
  encrypted               = false
  key_name                = module.keypair_0c319f.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}

output "ec2_instance_id_0c319f" { value = module.ec2_instance_0c319f.instance_id }
output "ec2_public_ip_0c319f"    { value = module.ec2_instance_0c319f.public_ip }
output "ec2_private_ip_0c319f"   { value = module.ec2_instance_0c319f.private_ip }
