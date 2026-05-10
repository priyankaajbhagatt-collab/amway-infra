terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Inputs the Backstage scaffolder template wires in.
variable "pipeline_name"   { type = string }
variable "service_name"    { type = string }
variable "market"          { type = string }
variable "group"           { type = string }
variable "source_repo"     { type = string }
variable "source_branch"   { type = string default = "main" }
variable "build_image"     { type = string default = "java" }
variable "buildspec_path"  { type = string default = "buildspec.yml" }
variable "argocd_app_name" { type = string }
variable "tags"            { type = map(string) default = {} }

# Stub: replace with real CodePipeline + IAM + S3 + CodeBuild.
# This null_resource lets `terraform plan` succeed for the demo.
resource "null_resource" "stub" {
  triggers = {
    pipeline_name = var.pipeline_name
    service       = var.service_name
    market        = var.market
  }
}

output "pipeline_arn" {
  value = "arn:aws:codepipeline:placeholder:000000000000:${var.pipeline_name}"
}
