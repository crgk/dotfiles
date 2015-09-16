# Git Utilities and Aliases

skypr()
{
    local br="$(git rev-parse --abbrev-ref HEAD)";
    open -a "/Applications/Google Chrome.app" "https://github.com/${1:-chadknight-wf}/${2:-bigsky}/pull/new/${1:-chadknight-wf}:${3:-master}...chadknight-wf:${4:-$br}";
}

alias mpr="skypr Workiva"
alias iampr="skypr chadknight-wf py-iam-services"
alias iammaster="mpr py-iam-services"
alias oauthtwopr="skypr chadknight-wf wf-oauthtwo-pyserver"
alias oauthtwomaster="mpr wf-oauthtwo-pyserver"
alias auditpr="skypr chadknight-wf py-audit-services"
alias auditmaster="mpr py-audit-services"
