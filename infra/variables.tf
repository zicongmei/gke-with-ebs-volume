variable "gcp_project_id" {
  description = "GCP project id"
}

variable "gcp-region" {
  description = "GCP region"
}

variable "aws-region" {
  default     = "us-west-2"
  description = "AWS region"
}

variable "aws-zone" {
  default     = "us-west-2a"
  description = "AWS zone"
}

variable "name" {
  description = "name"
}

data "aws_caller_identity" "current" {}

locals {
  account_id    = data.aws_caller_identity.current.account_id
  context       = "arn:aws:eks:${var.aws-region}:${local.account_id}:cluster/${local.cluster_name}"
  membership_id = lower(local.cluster_name)
}
