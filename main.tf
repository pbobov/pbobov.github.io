 terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.26"
    }
  }

  required_version = ">= 1.1.9"
}

provider "aws" {
  default_tags {
    tags = {
      ArcGISSiteId = var.site_id
    }
  }
}

# Chef Cookbooks

resource "aws_ssm_parameter" "test_url" {
  name  = "/test/${var.site_id}/url"
  type  = "String"
  value = var.url
  description = "Test URL"
  overwrite = true
}
