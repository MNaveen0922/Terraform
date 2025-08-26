#create an ec2 instance
resource "aws_instance" "nav_terra_ec2" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI (HVM), SSD Volume Type - us-east-1
  instance_type = "t2.micro"
  availability_zone = "us-east-1b"
  instance_state   = "running"
  tags = {
    Name = "Nav_terra_ec2"
  }


}

#create ebs volume
resource "aws_ebs_volume" "nav_terra_ebs" {
  availability_zone = "us-east-1b"
  size              = 10
  Type              = "gp3"

  tags = {
    Name = "Nav_terra_ebs"
  }
}


#attach ebs volume to ec2 instance
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/xvdf"
  volume_id   = aws_ebs_volume.nav_terra_ebs.id
  instance_id = aws_instance.nav_terra_ec2.id
}
