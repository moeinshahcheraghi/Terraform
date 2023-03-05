resource "aws_key_pair" "sshkey" {
  key_name   = "mykey"
  public_key = file("${var.PATH_TO_PUBLIC_KEY}")

}
resource "aws_instance" "demo" {
  ami                         = lookup(var.AMIS, var.AWS_REGION)
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.sshkey.key_name
  vpc_security_group_ids      = [aws_security_group.demo-sg.id]
  associate_public_ip_address = true


  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"

  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh"
    ]

  }
  connection {
    user        = var.INSTANCE_USERNAME
    private_key = file("${var.PATH_TO_PRIVATE_KEY}")
  }
}


output "ip" {
  value = aws_instance.demo.public_ip

}