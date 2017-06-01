function local --argument dir
	if test -z "$dir"
        cd ~/webdev/JS/local-dev-repos
        ls
    else
        cd ~/webdev/JS/local-dev-repos/$argv
        tree -C --dirsfirst --filelimit 20 -I node_modules
    end
end
