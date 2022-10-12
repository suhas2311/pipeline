resource "null_resource" "ec2_provisioner" {
    provisioner "local-exec" {
        command = "echo ${var.ec2_public_ip} >> conf/public_ips.txt"
    }
}
