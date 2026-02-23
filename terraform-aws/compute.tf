data "aws_ssm_parameter" "al2023_ami" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-6.1-x86_64"
}

resource "aws_instance" "app" {
  ami                         = data.aws_ssm_parameter.al2023_ami.value
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.app.id]
  associate_public_ip_address = true

  user_data = templatefile("${path.module}/user_data.sh.tftpl", {
    image_ref      = "${var.image_name}:${var.image_tag}"
    container_name = var.project_name
    public_port    = var.public_port
    app_port       = var.app_port
  })

  user_data_replace_on_change = true

  tags = {
    Name = "${var.project_name}-ec2"
  }
}
