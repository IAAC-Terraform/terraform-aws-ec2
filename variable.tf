variable "ec2_create" {}

variable "ami" {}

variable "instance_type" {}

variable "disable_api_termination" {}

variable "name" {}

variable "env" {}

variable "root_vol_type" {}

variable "root_vol_size" {}

variable "subnet_id" {
    type = "list"
}
