function fs
	if test -n "$argv"
        cd ~/webdev/JS/learn-js/fullstack/$argv
        ls
    else
        cd ~/webdev/JS/learn-js/fullstack
        ls
    end
end
