resource "aws_security_group" "app" {
  name        = "${var.project_name}-sg"
  description = "Security group for ${var.project_name}"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Public application access"
    from_port   = var.public_port
    to_port     = var.public_port
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidrs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-sg"
  }
}
