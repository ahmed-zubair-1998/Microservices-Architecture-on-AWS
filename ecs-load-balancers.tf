resource "aws_alb" "client_alb" {
  name_prefix        = "cl-"
  security_groups    = [aws_security_group.client_alb.id]
  load_balancer_type = "application"
  subnets            = aws_subnet.public.*.id
  idle_timeout       = 60
  ip_address_type    = "dualstack"
  tags = {
    "Name" = "${var.default_tags.project}-client-alb"
  }
}

resource "aws_lb_target_group" "client_alb_targets" {
  name_prefix          = "cl-"
  port                 = 9090
  protocol             = "HTTP"
  vpc_id               = aws_vpc.main.id
  deregistration_delay = 30
  target_type          = "ip"
  health_check {
    enabled             = true
    path                = "/"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 30
    interval            = 60
    protocol            = "HTTP"
  }
  tags = {
    "Name" = "${var.default_tags.project}-client-tg"
  }
}

resource "aws_alb_listener" "client_alb_http_80" {
  load_balancer_arn = aws_alb.client_alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.client_alb_targets.arn
  }
}

# Fruits
resource "aws_alb" "fruits_alb" {
  name_prefix        = "fr-"
  security_groups    = [aws_security_group.fruits_alb.id]
  load_balancer_type = "application"
  subnets            = aws_subnet.private.*.id
  idle_timeout       = 60
  internal           = true
  tags = {
    "Name" = "${var.default_tags.project}-fruits-alb"
  }
}

resource "aws_lb_target_group" "fruits_alb_targets" {
  name_prefix          = "fr-"
  port                 = 9090
  protocol             = "HTTP"
  vpc_id               = aws_vpc.main.id
  deregistration_delay = 30
  target_type          = "ip"
  health_check {
    enabled             = true
    path                = "/"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 30
    interval            = 60
    protocol            = "HTTP"
  }
  tags = {
    "Name" = "${var.default_tags.project}-fruits-tg"
  }
}

resource "aws_alb_listener" "fruits_alb_http_80" {
  load_balancer_arn = aws_alb.fruits_alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.fruits_alb_targets.arn
  }
}


# Vegetables
resource "aws_alb" "vegetables_alb" {
  name_prefix        = "ve-"
  security_groups    = [aws_security_group.vegetables_alb.id]
  load_balancer_type = "application"
  subnets            = aws_subnet.private.*.id
  idle_timeout       = 60
  internal           = true
  tags = {
    "Name" = "${var.default_tags.project}-vegetables-alb"
  }
}

resource "aws_lb_target_group" "vegetables_alb_targets" {
  name_prefix          = "ve-"
  port                 = 9090
  protocol             = "HTTP"
  vpc_id               = aws_vpc.main.id
  deregistration_delay = 30
  target_type          = "ip"
  health_check {
    enabled             = true
    path                = "/"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 30
    interval            = 60
    protocol            = "HTTP"
  }
  tags = {
    "Name" = "${var.default_tags.project}-vegetables-tg"
  }
}

resource "aws_alb_listener" "vegetables_alb_http_80" {
  load_balancer_arn = aws_alb.vegetables_alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.vegetables_alb_targets.arn
  }
}
