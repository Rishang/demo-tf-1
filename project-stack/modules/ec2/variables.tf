variable "ami_canonical_filter_name" {
  type        = string
  default     = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
  description = "Name for Canonical AMI filter"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "EC2 Instance type"
}

variable "instance_name" {
  type        = string
  default     = "terraform-ec2"
  description = "Name for EC2 instance"
}

variable "subnet_id" {
  type        = string
  default     = "subnet-0a0a0a0a0a0a0a0a0"
  description = "VPC Subnet ID associated with EC2 instance"
}

variable "security_group_ids" {
  type        = list(any)
  default     = []
  description = "Security Group ID associated with EC2 instance"
}

variable "volume_type" {
  type        = string
  default     = "gp2"
  description = "Root EBS Volume type for EC2 instance"
}

variable "volume_size" {
  type        = number
  default     = 8
  description = "Root EBS Volume size for EC2 instance"
}

# variable "key_name" {
#     type        = string
#     default     = ""
#     description = "SSH Key Name for EC2 instance"
# }

variable "additional_ebs_volumes" {
  type        = list(any)
  default     = []
  description = "Additional EBS Volumes for EC2 instance, eg: [1, 2, 3]"
}