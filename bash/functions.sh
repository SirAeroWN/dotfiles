################################################################################
#######                           FUNCTIONS                              #######
################################################################################


# send a notification
noty() {
    osascript -e 'display notification "your thing is done" with title "Done"'
}

spell() {
  echo "$@" | aspell list | sort -u
}

md() {
  test -n "$1" || return
  mkdir -p "$1" && cd "$1"
}

# from https://github.com/tangledhelix/dotfiles/blob/master/bash/function.sh
# Move backward through the directory tree easily. When called without
# an argument, goes back one level ('cd ..'). When called with a numeric
# argument, goes back that many levels.
#       '_cdback 2' == 'cd ../..'
#       '_cdback 3' == 'cd ../../..'
#       '_cdback 4' == 'cd ../../../..'
# When called with an optional second argument, cd's to that directory
# after having backed out $1 levels
_cdback() {
    local _count
    test -n "$1" && _count="$1" || _count="1"
    while [[ "$_count" > 0 ]]; do
        cd ..
        _count=$((_count - 1))
    done
    test -n "$2" && cd "$2"
}

epoch() {
  date -d @"$1" +"%Y-%m-%d %H:%M:%S"
}
