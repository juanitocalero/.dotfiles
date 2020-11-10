#!/bin/bash
# Taken from https://unix.stackexchange.com/questions/533664/how-to-auto-complete-based-on-the-buffer-contents-in-tmux
# And from fzf keybindings

__screen-autocomplete__() {
	tmux capture-pane -pS -100000 |      # Dump the tmux buffer.
	  tac |                              # Reverse so duplicates use the first match.
	  grep -P -o "[\w\d_\-\.\/]+" |      # Extract the words.
	  awk '{ if (!seen[$0]++) print }' | # De-duplicate them with awk, then pass to fzf.
	  fzf --no-sort --exact +i           # Pass to fzf for completion.
}

__screen_autocomplete-inline__() {
	local selected="$(__screen-autocomplete__)"
	READLINE_LINE="${READLINE_LINE:0:$READLINE_POINT}$selected${READLINE_LINE:$READLINE_POINT}"
	READLINE_POINT=$(( READLINE_POINT + ${#selected} ))
}

bind -x '"\C-n": "__screen_autocomplete-inline__"'
