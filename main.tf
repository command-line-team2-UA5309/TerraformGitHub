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

resource "github_branch_protection_v3" "main" {
  for_each = var.repositories

  repository     = github_repository.cli_team[each.key].name
  branch         = "main"
  enforce_admins = true

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    required_approving_review_count = 2
  }

  required_status_checks {
    strict = true
    checks = each.value
  }

  lifecycle {
    prevent_destroy = true
  }
}

