workflow "on push" {
  on = "push"
  resolves = ["shfmt"]
}

# Used for fix on review
workflow "on review" {
  resolves = ["shfmt"]
  on = "pull_request_review"
}

action "shfmt" {
  uses = "bltavares/actions/shfmt@master"
  # Enable autofix on push
  # args = ["autofix"]
  # Used for pushing changes for `fix` comments on review
  secrets = ["GITHUB_TOKEN"]
}
