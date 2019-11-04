# Setup fzf
# ---------
if [[ ! "$PATH" == */home/juan/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/juan/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/juan/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/juan/.fzf/shell/key-bindings.bash"

export FZF_DEFAULT_OPTS='--exact'

export FZF_DEFAULT_COMMAND='fd --hidden --follow --exclude .git'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

## Fuzzy Completion (**)

# Use fd instead of the default find
# command for listing path candidates.
_fzf_compgen_path() {
	fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
	fd --type d --hidden --follow --exclude ".git" . "$1"
}
