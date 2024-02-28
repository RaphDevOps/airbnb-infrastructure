resource "aws_instance" "web" {
  ami           = var.AMI_ID
  instance_type = var.INSTANCE_TYPE
  metadata_options {
     http_endpoint = "enabled"
     http_tokens   = "required"
  }
  iam_instance_profile = "AdminRoleEC2"
  tags = {
    Name = "airbnb-web-server"
    ENV = "dev"
  }
}