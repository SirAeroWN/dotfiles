################################################################################
#######                            ALIASES                               #######
################################################################################


### stuff from cassidoo ###
alias reload='source ~/.bash_profile'
alias a='echo "------------Your aliases------------";alias'
alias sa='source ~/.dotfiles/bash/aliases.sh;echo "Bash aliases sourced."'
alias bp='vim ~/.bash_profile'

# source program specific aliases
for f in $DOTHOME/bash/aliases/*.sh; do
  source "$f"
done

# Git Stuff

# Filesystem Stuff
alias ..='cd ..'
alias ...='cd ../../'
alias ....='_cdback 4'
alias .....='_cdback 5'
alias ......='_cdback 6'
alias .......='_cdback 7'
alias ........='_cdback 8'


### date stuff ###
alias utc="TZ=UTC date +%s"


### updates ###
alias update="sudo apt update && sudo apt upgrade"


### roots ###
alias root="sudo -i"
alias su="sudo -i"


### helps ###
alias howdoi="howdoi --color --all"


### mac specific ###
alias hdi="hdiutil"
alias hdid="hdiutil detach"
alias bfg="java -jar ~/bin/bfg.jar"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


### other ###
alias path='echo -e ${PATH//:/\\n}'
alias ba='vim ~/.dotfiles/bash/aliases.sh'
alias pe='path-extractor'
alias pf='path-extractor | sort -u | fzf'
alias open='xdg-open'
alias off='shutdown now'
