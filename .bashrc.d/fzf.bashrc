# Key bindings
# ------------
# Script location in Ubuntu
test -f /usr/share/doc/fzf/examples/key-bindings.bash && source /usr/share/doc/fzf/examples/key-bindings.bash
# Script location in Fedora
test -f /usr/share/fzf/shell/key-bindings.bash && source /usr/share/fzf/shell/key-bindings.bash

export FZF_DEFAULT_OPTS="--exact"
