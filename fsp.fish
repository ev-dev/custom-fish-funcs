function fsp
	if test -n "$argv"
        cd ~/webdev/JS/learn-js/fullstack/projects/$argv
    else
        cd ~/webdev/JS/learn-js/fullstack/projects
        l
    end
end
