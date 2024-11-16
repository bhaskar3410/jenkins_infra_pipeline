# configured aws provider and backend with proper credentials
provider "aws" {
  region = "us-west-1"
  assume_role {
    role_arn     = "arn:aws:iam::640111764884:role/stsassume-role"
    session_name = "terraform-sts"
  }
}
resource "aws_instance" "this" {
  ami           = "ami-012967cc5a8c9f891" # us-west-1
  instance_type = "t2.micro"
  key_name      = "awskeypair"
  tags = {
    Name = "Terraform-Instance"
  }
}
