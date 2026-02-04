terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {
  token = var.github_token
  owner = "command-line-team2-UA5309"
}

resource "github_repository" "created_repository" {
  for_each = var.repository_names

  name                   = each.value
  visibility             = "public"
  auto_init              = true
  delete_branch_on_merge = true
}

resource "github_branch_protection" "name" {
  for_each = var.repository_names

  repository_id  = github_repository.created_repository[each.value].node_id
  pattern        = "main"
  enforce_admins = true

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    required_approving_review_count = 2
  }
}
