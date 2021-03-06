# Git Utility

function pr() {
  local branch="$(git rev-parse --abbrev-ref HEAD)"
  local remote="$(git remote -v | grep origin -m 1 |  sed 's/.*git@github.com:\(.*\)\/.*/\1/g')"
  local repo="$(git remote -v | grep origin -m 1 |  sed 's/.*git@github.com:.*\/\(.*\)\.git.*/\1/g')"

  open "https://github.com/${remote}/${repo}/compare/${branch}?expand=1"
}

