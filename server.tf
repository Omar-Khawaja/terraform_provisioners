
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_key_pair" "examplekey" {
  key_name = "${var.keyname}"
  public_key = "${file("${var.public_key}")}"
}

resource "aws_instance" "server" {
  ami           = "${lookup(var.ami, var.region)}"
  key_name = "${aws_key_pair.examplekey.key_name}"
  tags {
    Name = "${var.name}"
  }
  instance_type = "${var.instance_type}"
  vpc_security_group_ids = ["${var.security_group}"]
  root_block_device {
    volume_type = "${var.volume_type}"
    volume_size = "${var.volume_size}"
    delete_on_termination = "${var.delete_on_termination}"
  }
  
  provisioner "file" {
    source = "scripts/install_httpd.sh"
    destination = "/tmp/install_httpd.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/install_httpd.sh",
      "sudo /tmp/install_httpd.sh",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd"
    ]
  }

  connection {
    user = "${var.username}"
    private_key = "${file("${var.private_key}")}"
    host = "${aws_instance.server.private_ip}"
  }
}
