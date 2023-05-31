resource "aws_ebs_volume" "ebs-volume1" {
  availability_zone = "us-west-2"
  size              = 20
  type              = "gp2"
  tags = {
    Name = "extra volume"
  }

}




resource "aws_volume_attachment" "ebs-volume1-attach" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.ebs-volume1.id
  instance_id = aws_instance.demo.id

}