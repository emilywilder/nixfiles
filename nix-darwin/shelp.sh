#!/usr/bin/env zsh
#https://stackoverflow.com/questions/4219255/how-do-you-get-the-list-of-targets-in-a-makefile/65243296#65243296

printf "%-20s %s\n" "Target" "Description"
printf "%-20s %s\n" "------" "-----------"
make -pqR : 2>/dev/null \
    | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($1 !~ "^[#.]") {print $1}}' \
    | sort \
    | egrep -v -e '^[^[:alnum:]]' -e '^$@$$' \
    | xargs -I _ sh -c 'printf "%-20s " _; make _ -nB | (grep -i "^# Help:" || echo "") | tail -1 | sed "s/^# Help: //g"'
