grulp () {
	if [[ -f Gruntfile.js ]]; then 
		grunt $*
	elif [[ -f gulpfile.js ]]; then
		gulp $*
	fi
}

alias git-profile="source /usr/local/bin/git-profile.sh"
