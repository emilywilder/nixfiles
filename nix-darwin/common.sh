export RESET_COLOR='\033[0m'
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'

error() {
  echo "${RED}ERROR:${RESET_COLOR} $*" >&2
  exit 1
}

warn() {
    echo "${YELLOW}WARNING:${RESET_COLOR} $*" >&2
}

info() {
    echo "${GREEN}INFO:${RESET_COLOR} $*"
}

info_on_stderr() {

}

get_user_id() {
    id -u
}

get_user_name() {
    id -un
}

is_root() {
    if [ "$(get_user_id)" -eq "0" ]
    then
        return 0
    else
        return 1
    fi
}
