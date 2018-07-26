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

