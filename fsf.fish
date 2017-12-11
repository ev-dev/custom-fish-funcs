function fsf
	if test -n "$argv"
        cd ~/webdev/JS/learn-js/fullstack/fellow/$argv
        ls -1
    else
        cd ~/webdev/JS/learn-js/fullstack/fellow
        ls -1
    end
end
