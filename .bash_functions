# function definitions sourced by .bashrc

fj () {
    local fd_cmd="fdfind -H -t d -E .git"

    if echo "$1" | egrep -q "^-[1-9][0-9]*"; then
        fd_cmd="$fd_cmd -d ${1#-}"
        shift
    fi
    cd $( $fd_cmd | fzf --exact +m -1 -q "$1")
}

fzv () {
    local fd_cmd="fdfind -H -t f -E .git"
    local query="$1"
    local files

    shift
    for q in "$@"; do
        query="${query} | $q"
    done

    if [ -z ${query} ]; then
        files=$( $fd_cmd | fzf --exact --multi -1 --prompt "Find files to edit: ")
    else
        files=$( $fd_cmd | fzf --exact --multi -1 -q "${query}" --prompt "Find files to edit: ")
    fi

    if [ $? -eq 0 ]; then
        vim ${files}
    fi
}
