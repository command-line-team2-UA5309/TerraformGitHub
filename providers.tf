terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket       = "cli-team-terraform-state"
    key          = "global/github/terraform.tfstate"
    region       = "eu-central-1"
    encrypt      = true
    use_lockfile = true
  }
}

provider "github" {
  token = var.github_token
  owner = "command-line-team2-UA5309"
}
