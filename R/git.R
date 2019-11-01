## Functions modifieed from pkgdown for deployment

git <- function(..., echo = TRUE, echo_cmd = echo) {
  processx::run("git", c(...), echo = echo, echo_cmd = echo_cmd)
}

git_clone <- function(repo, dir, branch = "master", depth = "1", echo = TRUE) {
  git("clone", "--single-branch", "-b", branch, "--depth",
      depth, repo, dir,  echo = echo)
}

git_addpush <- function(dir, commit_message, remote = "origin", branch = "master", echo = TRUE) {
  force(commit_message)
  withr::with_dir(dir, {
    git("add", "-A", ".", echo = echo)
    git("commit", "--allow-empty", "-m", commit_message,  echo = echo)
    git("push", "--force", remote, paste0("HEAD:", branch),  echo = echo)
  })
}
