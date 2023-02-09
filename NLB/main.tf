resource "aws_lb" "NLB" {
  name = var.nlb_name
  load_balancer_type = var.load_balancer_type
  internal           = true
  security_groups    = var.secGroupId
  subnets            = var.subnetID
  tags = {
    name        = var.nlb_name
  }
}

resource "aws_lb_target_group" "nlb-tg" {

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

resource "aws_lb_target_group_attachment" "assiciated_private_ec2_1" {
  target_group_arn = aws_lb_target_group.nlb-tg.arn
  target_id        = var.instanceID_1
  port             = 80
}

resource "aws_lb_target_group_attachment" "assiciated_private_ec2_2" {
  target_group_arn = aws_lb_target_group.nlb-tg.arn
  target_id        = var.instanceID_2
  port             = 80
}

resource "aws_lb_listener" "private-nlb-listener" {
  load_balancer_arn = aws_lb.NLB.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.nlb-tg.arn
    type             = "forward"
  }
}

