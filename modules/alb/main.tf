resource "aws_security_group" "alb_sg" {
  name_prefix = "alb_sg_"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# resource "aws_lb" "alb" {
#   name               = "ia-alb"
#   internal           = false
#   load_balancer_type = "application"
#   subnets            = [for id in module.vpc.public_subnet_id: public_subnet_id]
#   security_groups    = [aws_security_group.alb_sg.id]

#   tags = {
#     Name = "ia-alb"
#   }
# }


# create application load balancer
resource "aws_lb" "application_load_balancer" {
  name               = "server-alb"
  internal           = false
  load_balancer_type = "application"
  ip_address_type    = "ipv4"
  security_groups    = [var.security_group_id]
  subnets            = [var.public_subnet_id_1, var.public_subnet_id_2]
  enable_deletion_protection = false

  tags   = {
    Name = "Test Server"
  }
}

# create target group
resource "aws_lb_target_group" "alb_target_group" {
  name        = "server-alb"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id

  health_check {
    enabled             = true
    interval            = 300
    path                = "/"
    timeout             = 60
    matcher             = 200
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

}

# create a listener on port 80 with redirect action
resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = 80
  protocol          = "HTTP"
  # default_action {
  #   type = "fixed-response"
  #   target_group_arn = aws_lb_target_group.alb_target_group.arn
  #   fixed_response {
  #     content_type = "text/plain"
  #     message_body = "Fixed response content"
  #     status_code  = "200"
  #   }
  # }
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}

resource "aws_lb_target_group_attachment" "aws-tg-att" {
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id = var.ec2_id
  port = 80 
}