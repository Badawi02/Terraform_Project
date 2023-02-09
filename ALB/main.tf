resource "aws_lb" "ALB" {
  name = var.alb_name
  load_balancer_type = var.load_balancer_type
  internal           = false
  security_groups    = var.secGroupId
  subnets            = var.subnetID
  tags = {
    name        = var.alb_name
  }
}

resource "aws_lb_target_group" "alb-tg" {

  health_check {
    interval            = 10
    path                = "/"
    protocol            = "HTTP"
    timeout             = "5"
    healthy_threshold   = "5"
    unhealthy_threshold = "2"
  }
  name = var.targetGroupName
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpcID
  tags = {
    name = var.targetGroupName
  }
}

resource "aws_lb_target_group_attachment" "assiciated_public_ec2_1" {
  target_group_arn = aws_lb_target_group.alb-tg.id
  target_id        = var.instanceID_1
  port             = 80
}

resource "aws_lb_target_group_attachment" "assiciated_public_ec2_2" {
  target_group_arn = aws_lb_target_group.alb-tg.id
  target_id        = var.instanceID_2
  port             = 80
}

resource "aws_lb_listener" "public-alb-listener" {
  load_balancer_arn = aws_lb.ALB.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.alb-tg.arn
    type             = "forward"
  }
}

