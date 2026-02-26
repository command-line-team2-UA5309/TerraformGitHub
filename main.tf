resource "github_repository" "cli_team" {
  for_each = var.repository_names

  name                   = each.value
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
  for_each = var.repository_names

  repository     = github_repository.cli_team[each.value].name
  branch         = "main"
  enforce_admins = true

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    required_approving_review_count = 2
  }

  required_status_checks {
    strict = true
    checks = ["Markdown lint:15368"]
  }

  lifecycle {
    prevent_destroy = true
  }
}

