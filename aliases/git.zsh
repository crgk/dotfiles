# Git Utilities and Aliases

_git_pr ()
{
    local cur=$2
    __gitcomp_nl "$(__git_refs '' $track)"
}
mypr ()
{
    local br="$(git rev-parse --abbrev-ref HEAD)";
    open -a "/Applications/Google Chrome.app" "https://github.com/chadknight-wf/${1:-bigsky}/pull/new/${2:-chadknight-wf}:${3:-master}...chadknight-wf:${4:-$br}";
}
complete -o bashdefault -o default -o nospace -F _git_pr mypr 2>/dev/null

alias skypr="mypr bigsky"
alias mastersky="skypr WebFilings"
alias wbpr="mypr web-bones chadknight-wf"
alias masterbones="mypr web-bones WebFilings"
alias rapr="mypr richapps chadknight-wf"
alias masterra="mypr richapps WebFilings"
alias p34pr="mypr selenium chadknight-wf staging"
alias apipr="mypr api-testing WebFilings master"
