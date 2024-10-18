# Key bindings
# ------------
# Scripts location in Ubuntu
test -f /usr/share/doc/fzf/examples/key-bindings.bash && source /usr/share/doc/fzf/examples/key-bindings.bash
# Script location in Fedora
test -f /usr/share/fzf/shell/key-bindings.bash && source /usr/share/fzf/shell/key-bindings.bash

test -f /usr/share/bash-completion/completions/fzf && source /usr/share/bash-completion/completions/fzf

export FZF_DEFAULT_OPTS="--exact"
