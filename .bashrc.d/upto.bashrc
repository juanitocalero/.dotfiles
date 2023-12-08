
# JCC: Comando upto https://unix.stackexchange.com/a/14311/19560
upto ()
{
	if [ -z "$1" ]; then
		return
	fi
	local upto=$1
	cd "${PWD/\/$upto\/*//$upto}"
}

_upto()
{
	local cur=${COMP_WORDS[COMP_CWORD]}
	local d=${PWD//\//\ }
	COMPREPLY=( $( compgen -W "$d" -- "$cur" ) )
}
complete -F _upto upto


