variable "github_token" {
  description = "GitHub PAT token"
  type        = string
  sensitive   = true
}

variable "repository_names" {
  description = "List of names for GitHub repositories"
  type        = set(string)
  default     = ["TerraformAWS", "AnsiblePlaybooks", "Django_Backend"]
}
