resource "aws_instance" "ec2" {
  count = "${var.ec2_create ? 1 : 0}"
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  availability_zone = "${var.availability_zone}"
  disable_api_termination = "${var.disable_api_termination}"
  
  volume_tags {
      name = "${var.name}-vol-0${count.index + 1}"
      env = "${var.env}"
  }

  root_block_device {
      volume_type = "${var.root_vol_type}"
      volume_size = "${var.root_vol_size}"
  }

  ebs_block_device {
      volume_type = "${var.ebs_vol_type}"
      device_name = "${var.device_name}"
      encrypted = "${var.encrypted}"
  }

  tags {
      Name = "${var.name}-0${count.index + 1}"
      env = "${var.env}"
  }
}