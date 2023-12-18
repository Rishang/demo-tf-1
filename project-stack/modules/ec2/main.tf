data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami_canonical_filter_name]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
locals {
  mum_alfa_map = {
    "0": "a",
    "1": "b",
    "2": "c",
    "3": "d",
    "4": "e",
    "5": "f",
    "6": "g",
    "7": "h",
    "8": "i",
    "9": "j",
    "10": "k",
  }
}

resource "aws_instance" "this" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group_ids
  associate_public_ip_address = true

  root_block_device {
    volume_type = var.volume_type
    volume_size = var.volume_size
  }

  # key_name = var.key_name

  tags = {
    Name = var.instance_name
  }
}

resource "aws_ebs_volume" "extra_volume" {
  count             = length(var.additional_ebs_volumes)
  availability_zone = aws_instance.this.availability_zone
  size              = var.additional_ebs_volumes[count.index]
  tags = {
    Name = var.instance_name
  }
}

resource "aws_volume_attachment" "extra_volume" {
  count       = length(var.additional_ebs_volumes)
  device_name = "/dev/xvdb${local.mum_alfa_map[tostring(count.index)]}"
  volume_id   = aws_ebs_volume.extra_volume[count.index].id
  instance_id = aws_instance.this.id
}
