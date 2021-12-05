variable "tags" {
  description = "A map of tags to add to all resources"

  default = {
    "tr:resource-owner"               = "EnterpriseCloudOperations@thomsonreuters.com"
    "tr:application-asset-insight-id" = "206256"
    "tr:environment-type"             = "sandbox"
    "tr:financial-identifier"         = "0000066497"
    "tr:testing"                      = "true"
  }
}

variable "region" {
  description = "AWS region"
}
