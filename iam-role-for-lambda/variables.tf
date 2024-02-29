variable "region" {
  description = "AWS region name"
  type        = string
  default     = "ap-south-1"
}

variable "tags" {
  description = "Tags to add all resources"
  default = {
    "env"        = "DEV"
    "owner"      = "DevOps"
    "Managed-by" = "Sumit"
    "AutoStartStop" = "Yes"
  }
}

