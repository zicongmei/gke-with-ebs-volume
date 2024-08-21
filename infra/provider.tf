terraform {
  required_version = ">= 0.13.1"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.71"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 4.71"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.20.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.1.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.1.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.1"
    }
  }
}

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp-region
}

provider "google-beta" {
  project = var.gcp_project_id
  region  = var.gcp-region
}

provider "aws" {
  region = var.aws-region
}
