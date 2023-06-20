#!/bin/bash

# Generates a bash completion file for the `ivpn` CLI.
# 
# Usage:
# Install the ivpn CLI package first: https://www.ivpn.net/apps-linux/
#
# $ bash-completion-generator-ivpn-cli.sh > ivpn.bash
# $ source ivpn.bash
# $ sudo mv ivpn.bash /usr/share/bash-completion/completions/ivpn
# $ sudo chown root:root /usr/share/bash-completion/completions/ivpn

# print header
echo "# bash completion for ivpn"
echo ""
echo "_ivpn()"
echo "{"
echo '    local cur prev opts base'
echo '    COMPREPLY=()'
echo '    cur="${COMP_WORDS[COMP_CWORD]}"'
echo '    prev="${COMP_WORDS[COMP_CWORD-1]}"'
echo ""


# determine command list and print list
# first awk bit from: https://stackoverflow.com/a/22222219
COMMAND_LIST=$(ivpn -h | grep -Ev ^$ | awk '/Tips:/{f=0} f; /COMMANDS:/{f=1}' | awk '{ print $1 }')

echo "    opts="'"'$COMMAND_LIST" -h"'"'
echo ""
echo '    case "${prev}" in'


# iterate over commands and print case entries for sub-commands
for i in $COMMAND_LIST; do
    echo "        "$i")"
    SUB_LIST=$(ivpn $i -h | grep -E '^  -' | awk '{ print $1 }' | tr "|" " ")
    echo "            local "$i"_opts="'"'$SUB_LIST" -h"'"'
    echo "            COMPREPLY=( \$(compgen -W "'"'"\${"$i"_opts}"'"'" -- \${cur}) )"
    echo "            return 0"
    echo "            ;;"
done


# print footer
echo "        -*)"
echo "            return 0"
echo "            ;;"
echo "    esac"
echo ""
echo '   COMPREPLY=($(compgen -W "${opts}" -- ${cur}))'
echo "   return 0"
echo "}"
echo "complete -F _ivpn ivpn"
echo ""

exit 0
