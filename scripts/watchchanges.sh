#!/usr/bin/env zsh

# Watch two files and show pkgs. differences between them on file changes.

# EXAMPLES:
#   zsh scripts/watchchanges.sh hosts modules/home/packages/default.nix hosts/athena/home.nix

colwidth () {
  echo $COLUMNS / 3 | bc
}

delim () {
  printf "%-$(colwidth)s" ''
}

header () {
  printf "%-$(colwidth)s%-$(colwidth)s%-$(colwidth)s\n" $1 $2 $3
  printf -- '-%.0s' {1..$COLUMNS}
}

comm_sp_pkgs () {
  sort $1 | rg -v '^\s*#.*$' | rg 'pkgs\.'
}

watchchanges () {
  fswatch -o $1 | while read _
  do
    clear
    header $2 $3 Both
    comm --output-delimiter="$(delim)" <( comm_sp_pkgs $2 ) <( comm_sp_pkgs $3 )
  done
}

watchchanges $1 $2 $3
