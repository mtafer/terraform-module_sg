terraform {
  required_version = ">= 0.12"

  backend "s3" {
    key          = "state-file-commodoties-testing"
    session_name = "commodoties-testing-deployment"
  }
}

provider "aws" {
  region = "${var.region}"
}

module "sg" {
  source = "../"
#   source = "git::https://git.sami.int.thomsonreuters.com/cloud-service-catalog/aws-tf-securitygroups.git?ref=v1.0.0"

  name        = "a206256-sg-commodoties-testing"
  description = "a206256-sg-commodoties-testing"
  vpc_id      = "vpc-0e21d88ce6980772d"
  tags        = var.tags
}

# Inbound rules
resource "aws_security_group_rule" "ingress_rules_http" {

  security_group_id = module.sg.this_security_group_vpc_id
  type              = "ingress"
  cidr_blocks       = ["10.0.0.0/24"]
  from_port         = "80"
  to_port           = "80"
  protocol          = "tcp"
  description       = "HTTP"

}

resource "aws_security_group_rule" "ingress_rules_https" {

  security_group_id = module.sg.this_security_group_vpc_id
  type              = "ingress"
  cidr_blocks       = ["10.0.0.0/24"]
  from_port         = "443"
  to_port           = "443"
  protocol          = "tcp"
  description       = "HTTPS"

}

# Outbound rules
resource "aws_security_group_rule" "egress_rules" {

  security_group_id = module.sg.this_security_group_vpc_id
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = "0"
  to_port           = "65535"
  protocol          = "All"
  description       = "All traffic"

}