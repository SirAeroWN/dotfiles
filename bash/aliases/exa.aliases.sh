################################################################################
#######                        EXA ALIASES                               #######
################################################################################

if [ "$( command -v exa )" ]; then
  alias l='exa'
  alias la='exa --all'
  alias ll='exa --all --long'
  alias lt='exa --tree --level=5'
  alias lg='exa --all --long --git'
else
  alias l='ls -F'
  alias la='ls -aF'
  alias ll='ls -lhAF'
fi

