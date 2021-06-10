variable "aws_access_key" {
  description = "AWS Access Key"
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
}

variable "aws_region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "key_pair" {
  description = "Key pair used to login to the instance"
}

variable "instance_type" {
  description = "Instance type for the Jenkins server"
  default     = "t3.medium"
}
variable "bucket" {
  description = "The bucket used for accessing artifacts"
}

variable "org_name" {
  description = "The name of the TFE Organization"
}

variable "workspace_name" {
  description = "The name of the TFE workspace"
}

variable "prefix" {
  description = "Unique prefix for naming"
}

variable "owner" {
  description = "Email address of the person running this configuration"
}

variable "ttl" {
  description = "Hours to stay online"
  default     = "24"
}

# May need for later
# variable "aws_session_token" {
#     description = "AWS Session Token"
# }

