grulp () {
	if [[ -f Gruntfile.js ]]; then 
		grunt $*
	elif [[ -f gulpfile.js ]]; then
		gulp $*
	fi
}
