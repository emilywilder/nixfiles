# from https://cloud.theodo.com/en/blog/beautiful-makefile-awk
# with some modifications
BEGIN {
    FS = ":.*##"
    printf "Usage:\n  make \033[36m<target>\033[0m\n"
}

/^[[:alnum:]]+[[:blank:]]*:.*?##/ {
    printf "  \033[36m%-15s\033[0m %s\n", $1, $2
}

/^##@/ {
    printf "\n\033[1m%s\033[0m\n", substr($0, 5)
}
