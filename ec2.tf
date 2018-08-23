resource "aws_network_interface" "eni" {
  count = "${var.ec2_create ? 1 : 0}"
  subnet_id = "${element(var.subnet_id, count.index)}"
  tags {
    Name = "${var.name}-eni-0${count.index + 1}"
    env = "${var.env}"
  }
}

resource "aws_instance" "ec2" {
  count = "${var.ec2_create ? 1 : 0}"
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  disable_api_termination = "${var.disable_api_termination}"
  
  volume_tags {
      name = "${var.name}-vol-0${count.index + 1}"
      env = "${var.env}"
  }

  root_block_device {
      volume_type = "${var.root_vol_type}"
      volume_size = "${var.root_vol_size}"
  }

  network_interface {
      device_index = "${count.index}"
      network_interface_id = "${element(aws_network_interface.eni.*.id, count.index)}"
  }

  tags {
      Name = "${var.name}-0${count.index + 1}"
      env = "${var.env}"
  }
}