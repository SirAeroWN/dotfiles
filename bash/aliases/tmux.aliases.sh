alias txl='tmux ls'
alias txn='tmux new -s'
alias txa='tmux a -t'
alias txrm='tmux new -s remappy'
txp () {
  tmux ls | awk '{print $1 $8}' | sed s/:/\ started\ at\ / | yank;
  tmux a -t "$( pbpaste )";
}
