## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ebs_volume.extra_volume](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ebs_volume) | resource |
| [aws_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_volume_attachment.extra_volume](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/volume_attachment) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_ebs_volumes"></a> [additional\_ebs\_volumes](#input\_additional\_ebs\_volumes) | Additional EBS Volumes for EC2 instance, eg: [1, 2, 3] | `list(any)` | `[]` | no |
| <a name="input_ami_canonical_filter_name"></a> [ami\_canonical\_filter\_name](#input\_ami\_canonical\_filter\_name) | Name for Canonical AMI filter | `string` | `"ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Name for EC2 instance | `string` | `"terraform-ec2"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | EC2 Instance type | `string` | `"t2.micro"` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | Security Group ID associated with EC2 instance | `list` | `[]` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | VPC Subnet ID associated with EC2 instance | `string` | `"subnet-0a0a0a0a0a0a0a0a0"` | no |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | Root EBS Volume size for EC2 instance | `number` | `8` | no |
| <a name="input_volume_type"></a> [volume\_type](#input\_volume\_type) | Root EBS Volume type for EC2 instance | `string` | `"gp2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | The ID of the instance |
| <a name="output_instance_private_ip"></a> [instance\_private\_ip](#output\_instance\_private\_ip) | The private IP address assigned to the instance |
| <a name="output_instance_public_ip"></a> [instance\_public\_ip](#output\_instance\_public\_ip) | The public IP address assigned to the instance |
