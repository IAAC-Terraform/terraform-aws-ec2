output "instanceid" {
    value = "${aws_instance.ec2.*.id}"
}

output "instancearn" {
    value = "${aws_instance.ec2.*.arn}"
}

output "instanceprivateip" {
    value = "${aws_instance.ec2.*.private_ip}"
}

output "subnet_id" {
    value = "${aws_instance.ec2.*.subnet_id}"
}