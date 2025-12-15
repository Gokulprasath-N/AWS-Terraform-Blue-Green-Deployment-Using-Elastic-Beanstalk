variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "app_name" {
  description = "Name of the Elastic Beanstalk application"
  type        = string
  default     = "my-app-bluegreen"
}

variable "instance_type" {
  description = "EC2 instance type for Elastic Beanstalk environments"
  type        = string
  default     = "t3.micro"
}

# [FIX] Switched to Solution Stack Name instead of Platform ARN
# Platform ARNs contain the Region (e.g., us-east-1). If you deployed
# to us-west-2 using the ARN, it would fail. Solution Stack Name is region-agnostic.
variable "solution_stack_name" {
  description = "Elastic Beanstalk solution stack name (platform)"
  type        = string
  default     = "64bit Amazon Linux 2023 v6.3.0 running Node.js 20"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    Project     = "BlueGreenDeployment"
    Environment = "Demo"
    ManagedBy   = "Terraform"
  }
}