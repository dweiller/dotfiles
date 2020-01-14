# function definitions sourced by .bashrc

fj () {
    local fd_cmd="fd -t d"

    if echo "$1" | egrep -q "^-[1-9][0-9]*"; then
        fd_cmd="$fd_cmd -d ${1#-}"
        shift
    fi
    cd $( $fd_cmd | fzf +m -1 -q "$1")
}
