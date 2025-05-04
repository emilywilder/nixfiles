#!/usr/bin/env zsh
# needs string sub

# unquote("string") -> string
unquote() {
    local -r _arg=${1:?}
    echo ${_arg//\"/}
}

# getNixDarwinUrl(nixFile) -> nixDarwinUrl
getNixDarwinUrl() {
    nix eval -f ${1:?} inputs.nix-darwin.url
    return $?
}

# getRepoFromUrl(nixDarwinUrl) -> repo
getRepoFromUrl() {
    local -r _arg=${1:?}
    echo ${_arg#*:*/}
}

# getRebuildTargetFromRepo(repo) -> rebuildTarget
getRebuildTargetFromRepo() {
    echo "${1:?}#darwin-rebuild"
}

# initNixDarwin(rebuildTarget) -> null
initNixDarwin() {
    nix run ${1:?} -- switch
    return $?
}

initNixDarwin $(
    getRebuildTargetFromRepo $(
        getRepoFromUrl $(
            unquote $(
                getNixDarwinUrl ${1:?no nix file given}
            )
        )
    )
)
