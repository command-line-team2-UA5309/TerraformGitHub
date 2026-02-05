resource "github_repository" "command-line-team_repository" {
  for_each = var.repository_names

  name                   = each.value
  visibility             = "public"
  delete_branch_on_merge = true

  template {
    owner                = "command-line-team2-UA5309"
    repository           = "template"
    include_all_branches = false
  }
}

resource "github_branch_protection" "command-line-team_repository_branch_protection_rules" {
  for_each = var.repository_names

  repository_id  = github_repository.command-line-team_repository[each.value].node_id
  pattern        = "main"
  enforce_admins = true

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    required_approving_review_count = 2
  }

  required_status_checks {
    strict   = true
    contexts = ["Markdown lint"]
  }
}
