variable "github_token" {
  description = "GitHub PAT token"
  type        = string
  sensitive   = true
}

variable "repositories" {
  description = "GitHub repository names and corresponding required checks(linters) for each repository main branch"
  type        = map(set(string))
  default = {
    VueFrontend          = ["Markdown lint:15368"]
    DjangoBackend        = ["Markdown lint:15368"]
    MapService           = ["Markdown lint:15368"]
    EmailMicroservice    = ["Markdown lint:15368"]
    DayPassService       = ["Markdown lint:15368", "Run golangci-lint:15368"]
    InfrastructureSecret = ["Markdown lint:15368"]
    IAC_AWS              = ["Markdown lint:15368"]
  }
}
