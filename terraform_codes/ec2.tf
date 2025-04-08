data "aws_ami" "azlinux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

}

resource "aws_instance" "node_app" {
  ami                         = data.aws_ami.azlinux.id
  instance_type               = "t2.micro"
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.pub-sub-1.id
  vpc_security_group_ids      = [aws_security_group.app_sg.id]
  associate_public_ip_address = true
  //security_groups = [aws_security_group.app_sg]
  //user_data = file("install-docker.sh")

  tags = {
    Name = "node-app"
  }
}