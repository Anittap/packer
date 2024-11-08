variable "regions" {
  type        = map(string)
  description = "AWS region maps"
  default = {
    "production" : "ap-south-1"
    "development" : "us-east-1"
    "testing" : "us-east-2"
  }
}
variable "environment" {
  type        = string
  description = "Project environment"
  default     = "development"
}
variable "project_name" {
  type        = string
  description = "Project name"
  default     = "packerdemo"
}
locals {
  ami_name = "${var.project_name}-${var.environment}-${formatdate("DD-MMM-YYYY-hh-mm", timestamp())}"
}
variable "instance_type" {
  type        = string
  description = "instance type"
  default     = "t2.micro"
}
locals {
  source_ami_id   = data.amazon-ami.amazonlinux.id
  source_ami_name = data.amazon-ami.amazonlinux.name
}

