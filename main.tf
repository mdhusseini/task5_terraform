provider "aws" {
  profile = "default"
  region  = "ap-southeast-1"
}

resource "aws_kms_key" "test-devops-kms-key-dev-eu-west-1" {
  description             = "KMS key for test-devops-kms-key-dev-eu-west-1"
  deletion_window_in_days = 10
}

resource "aws_dynamodb_table" "test-devops-dynamodb-dev-eu-west-1" {
  name              = "test-devops-dynamodb-dev-eu-west-1"
  read_capacity     = 5
  write_capacity    = 5
  hash_key          = "id"
  range_key         = "version"
  stream_enabled    = true
  stream_view_type  = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "version"
    type = "N"
  }
}

resource "aws_instance" "test-devops-ec2-dev-eu-west-1" {
  ami           = "ami-01f5faf2ee7e869bb"
  instance_type = "t2.micro"
  iam_instance_profile  = aws_iam_instance_profile.ec2_profile.name
  tags = {
    Name = "test-devops-ec2-dev-eu-west-1"
  }
}

resource "aws_iam_role" "test-devops-role-dev-eu-west-1" {
  name = "test-devops-role-dev-eu-west-1"

  assume_role_policy = data.aws_iam_policy_document.assume_policy.json
  
  inline_policy {
    name   = "policy-1"
    policy = data.aws_iam_policy_document.role_inline_policy.json
  }
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = aws_iam_role.test-devops-role-dev-eu-west-1.name
}