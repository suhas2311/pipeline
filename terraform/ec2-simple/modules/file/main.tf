resource "null_resource" "ec2_provisioner" {
    connection {
        type = "ssh"
        user = var.ec2_user
        agent = false
        host = "${var.ec2_public_ip}"
        private_key = file("keys/devops-june-2022.pem")
    }
    
    provisioner "file" {
        source      = "conf/myapp.conf"
        destination = "/home/ubuntu/myapp.conf"
    }
}
