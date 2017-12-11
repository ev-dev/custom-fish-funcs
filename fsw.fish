function fsw
	if test -n "$argv"
        cd ~/webdev/JS/learn-js/fullstack/workshops/$argv
        lst
    else
        cd ~/webdev/JS/learn-js/fullstack/workshops
        l
    end
end
