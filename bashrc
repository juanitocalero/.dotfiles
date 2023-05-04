# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


for file in ~/.bashrc.d/*.bashrc;
do
  source "$file"
done


# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# Remove the ugly green background in "Other writables" files in ls
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"


# In WSL with disabled PATH integration, to be able to use utils such clip.exe
# export PATH="${PATH}:/mnt/c/WINDOWS/system32"
# or vscode
# alias "vscode-win=/mnt/c/Users/JCAL/AppData/Local/Programs/Microsoft\ VS\ Code/bin/code"

# Better tab autocompletion handling (https://stackoverflow.com/a/48514114/134898) 
bind 'TAB':menu-complete
bind "set show-all-if-ambiguous on"
bind "set menu-complete-display-prefix on"

# Alt-j to repeat last word (https://unix.stackexchange.com/a/356700/19560)
# bind "\ej":"!#:$\e^"

# To share last commands with new shells. Use `history -n` to refresh
# previous shells. 
export PROMPT_COMMAND="history -a"
