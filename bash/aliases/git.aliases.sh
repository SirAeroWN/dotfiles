################################################################################
#######                       BASH ALIASES                               #######
################################################################################

alias co='git checkout'
alias st='git status'
alias yolo='git status && git add -A && git commit -m "I do what I want" && git push origin master'
alias stw='git diff --ignore-all-space 2>&1 | grep "^--- a" | sed "s/^--- a//"'

# add bash autocomplete to git aliases (hopefully)
if [ -f /usr/share/bash-completion/completions/git ]; then
  source /usr/share/bash-completion/completions/git
  __git_complete co _git_checkout
  __git_complete st _git_status
fi
