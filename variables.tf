variable "github_token" {
  description = "GitHub PAT token"
  type        = string
  sensitive   = true
}

variable "repositories" {
  description = "GitHub repository names and corresponding required checks(linters) for each repository main branch"
  type        = map(set(string))
  default = {
    VueFrontend          = ["Markdown lint"]
    DjangoBackend        = ["Markdown lint"]
    MapService           = ["Markdown lint"]
    EmailMicroservice    = ["Markdown lint", "Run golangci-lint"]
    DayPassService       = ["Markdown lint", "Run golangci-lint"]
    InfrastructureSecret = ["Markdown lint"]
    IAC_AWS              = ["Markdown lint"]
  }
}
