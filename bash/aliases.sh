################################################################################
#######                            ALIASES                               #######
################################################################################


### stuff from cassidoo ###
alias reload='source ~/.bash_profile'
alias a='echo "------------Your aliases------------";alias'
alias sa='source ~/.dotfiles/bash/aliases.sh;echo "Bash aliases sourced."'
alias bp='vim ~/.bash_profile'


# Git Stuff
alias co='git checkout'
alias st='git status'
alias yolo='git status && git add -A && git commit -m "I do what I want" && git push origin master'

# add bash autocomplete to git aliases (hopefully)
if [ -f /usr/share/bash-completion/completions/git ]; then
  source /usr/share/bash-completion/completions/git
  __git_complete co _git_checkout
  __git_complete st _git_status
fi

# Filesystem Stuff
# alias l='ls -F'
# alias la='ls -aF'
# alias ll='ls -lhAF'
alias ..='cd ..'
alias ...='cd ../../'

# using exa instead of ls
alias l='exa'
alias la='exa --all'
alias ll='exa --all --long'
alias lt='exa --tree --level=5'
alias lg='exa --all --long --git'


### vim ###
alias v="vim"
alias vi="vim"
alias vip="vim -p"
alias svi="sudo vim"
alias vic="vim ~/.vim_runtime/my_configs.vim"
alias va="vim $DOTHOME/bash/aliases.sh"

### neovim ###
alias nv="nvim"


### updates ###
alias update="sudo apt update && sudo apt upgrade"


### roots ###
alias root="sudo -i"
alias su="sudo -i"


### helps ###
alias howdoi="howdoi --color --all"


### maven ###
alias mvnci="mvn clean install"
alias mvnstci="mvn -DskipTests=True clean install"


### mac specific ###
alias hdi="hdiutil"
alias hdid="hdiutil detach"
alias bfg="java -jar ~/bin/bfg.jar"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


### other ###
alias path='echo -e ${PATH//:/\\n}'
alias ba='vim ~/.dotfiles/bash/aliases.sh'
