resource "aws_security_group_rule" "allow_nodeport_from_my_ip" {
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 30080
  to_port           = 30080
  security_group_id = module.eks.node_security_group_id
  cidr_blocks       = [var.my_ip_cidr]
  description       = "Allow NodePort 30080 from my IP"
}

