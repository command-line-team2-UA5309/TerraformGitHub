# TerraformGitHub

> [!IMPORTANT]  
> Since the state is now stored in AWS S3, you need to set up your AWS credentials
> before running `terraform` commands.
> To do this, either:
> - define your `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` environment variables
> - or run `aws configure` 

## How to use

In the repo directory run following commands:

```bash
terraform init
```

Export your GitHub Personal Access Token (do not store it in the code):

```bash
export TF_VAR_github_token="{your token here}"
```

Review the planned changes before applying:

```bash
terraform plan
```

Create a Pull Request and wait for team approval.
After the PR is approved, run:

```bash
terraform apply
```
