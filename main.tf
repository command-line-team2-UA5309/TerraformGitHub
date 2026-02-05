resource "github_repository" "command-line-team_repository" {
  for_each = var.repository_names

  name                   = each.value
  visibility             = "public"
  auto_init              = true
  delete_branch_on_merge = true
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
}
