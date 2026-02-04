variable "github_token" {
  description = "GitHub PAT token"
  ephemeral   = true
  type        = string
  sensitive   = true
}
