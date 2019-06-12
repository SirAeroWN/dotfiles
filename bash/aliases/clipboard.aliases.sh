case $( uname | tr '[:upper:]' '[:lower:]' ) in
  linux*)
    XCLIP=$(command -v xclip)
    [[ $XCLIP ]] && \
    alias pbcopy="$XCLIP -selection clipboard" && \
    alias pbpaste="$XCLIP -selection clipboard -o" && \
    alias shrug="echo \"¯\\_(ツ)_/¯\" | $XCLIP -selection clipboard" && \
    alias tableflip="echo \"(╯°□°）╯︵ ┻━┻\" | $XCLIP -selection clipboard"
    ;;
esac

# to use it just install xclip on your distribution and it would work like:
# $ echo "hello" | pbcopy
# $ pbpaste
# hello

# very useful for things like:
# cat ~/.ssh/id_rsa.pub | pbcopy
# have fun!
