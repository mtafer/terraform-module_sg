# AWS Security Group module

These types of resources are supported:

* [Security Group](https://www.terraform.io/docs/providers/aws/r/security_group.html)

## Terraform versions

Terraform 0.12.

## Usage

`sg`:
```hcl
module "sg" {
  source = "../"
#   source = "git::https://git.sami.int.thomsonreuters.com/cloud-service-catalog/aws-tf-securitygroups.git?ref=v1.0.0"

  name        = "a206256-sg-commodoties-testing"
  description = "a206256-sg-commodoties-testing"
  vpc_id      = "vpc-0e21d88ce6980772d"
  tags        = var.tags
}
```