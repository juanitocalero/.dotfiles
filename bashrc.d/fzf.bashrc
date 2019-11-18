# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jcal/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/jcal/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/jcal/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/jcal/.fzf/shell/key-bindings.bash"

export FZF_DEFAULT_OPTS='--exact'

export FZF_DEFAULT_COMMAND='fd --hidden --no-ignore-vcs --follow --exclude .git'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

## Fuzzy Completion (**)

# Use fd instead of the default find
# command for listing path candidates.
_fzf_compgen_path() {
	fd --hidden --no-ignore-vcs --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
	fd --type d --hidden --no-ignore-vcs --follow --exclude ".git" . "$1"
}
