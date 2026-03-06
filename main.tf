resource "github_repository" "cli_team" {
  for_each = var.repositories

  name                   = each.key
  visibility             = "public"
  delete_branch_on_merge = true

  template {
    owner                = "command-line-team2-UA5309"
    repository           = "template"
    include_all_branches = false
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "github_branch_protection" "main" {
  for_each = var.repositories

  repository_id  = github_repository.cli_team[each.key].id
  pattern        = "main"
  enforce_admins = true

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    required_approving_review_count = 1
  }

  required_status_checks {
    strict   = true
    contexts = each.value
  }

  lifecycle {
    prevent_destroy = true
  }
}
