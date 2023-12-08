#!/bin/bash

__snippets_picker__() {
	cat ~/snippets | fzf          
}

__snippets_picker-inline__() {
	local selected="$(__snippets_picker__)"
	READLINE_LINE="${READLINE_LINE:0:$READLINE_POINT}$selected${READLINE_LINE:$READLINE_POINT}"
	READLINE_POINT=$(( READLINE_POINT + ${#selected} ))
}

# Disable default Ctrl-S behaviour (XOFF, never used)
stty -ixon

bind -x '"\C-s": "__snippets_picker-inline__"'
