# SSH лише з мого IP
resource "aws_security_group" "public" {
  name        = "${var.project_name}-public-sg"
  description = "SSH from my IP only, all outbound"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-public-sg"
  }
}

# SSH лише з публічного інстансу
resource "aws_security_group" "private" {
  name        = "${var.project_name}-private-sg"
  description = "SSH from public instance only, all outbound"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "SSH from public instance"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.public.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-private-sg"
  }
