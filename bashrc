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

# Big history!
HISTFILESIZE=10000

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# Remove the ugly green background in "Other writables" files in ls
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"

# [ -f ~/.fzf.bash ] && source ~/.fzf.bash

