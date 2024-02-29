# VPC Variables
variable "ec2_instance_stop" {
  description = "Name for lambda function"
  type        = string
  default     = "ec2_stop_lambda"
}

variable "ec2_instance_start" {
  description = "Name for lambda function"
  type        = string
  default     = "ec2_start_lambda"
}

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

variable "lambda_role" {
  description = "Role for lambda exceution"
  type = string
  default = "arn:aws:iam::024566704690:role/service-role/lambda_role"
}

variable "runtime_version" {
  description = "Runtime envrionmen and version for Lambda function"
  type = string
  default = "python3.12"
}

variable "start_target_name" {
  default = "start-ec2-instance"
  type = string
}

variable "stop_target_name" {
  default = "stop-ec2-instance"
  type = string
}

variable "start_event_rule_name" {
  default = "LambdaStartRule"
  type = string
}

variable "start_event_schedule" {
  default = "cron(0 8 ? * MON-FRI *)"
  type = string
}

variable "stop_event_rule_name" {
  default = "LambdaStopRule"
  type = string
}

variable "stop_event_schedule" {
  default = "cron(0 17 ? * MON-FRI *)"
  type = string
}