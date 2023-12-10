# Data of default vpc
data "aws_vpc" "default" {
  default = true
}

# Data of vpc subnets
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Security Group for HTTP and HTTPS
resource "aws_security_group" "demo" {
  name        = var.prefix
  description = "Security Group for HTTP and HTTPS"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Demo EC2 instance
module "ec2" {
  source = "../modules/ec2"

  instance_type             = var.instance_type
  ami_canonical_filter_name = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"

  instance_name          = var.prefix
  subnet_id              = ""
  security_group_ids     = [aws_security_group.demo.id]
  # key_name               = ""
  additional_ebs_volumes = [8]
}

# Demo lambda function

resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "lambda_policy" {
  name = "lambda_policy"
  role = aws_iam_role.lambda_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:*"
      ],
      "Resource": "arn:aws:logs:*:*:*"
    }
  ]
}
EOF
}

module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = var.prefix
  description   = "My awesome lambda function"
  handler       = "main.lambda_handler"
  runtime       = "python3.8"

  create_role     = false
  lambda_role    = aws_iam_role.lambda_role.arn
  source_path = "../code/lambda-1"

  tags = {
    Name = var.prefix
  }
}