function local --argument dir
	if test -z "$dir"
        cd ~/webdev/JS/local-dev-repos
        ls
    else
        cd ~/webdev/JS/local-dev-repos/$argv
        ls -1
    end
end
