function nodeschool
	if test -n "$argv"
        cd ~/webdev/JS/learn-js/nodeschool/$argv
        ls -C
    else
        cd ~/webdev/JS/learn-js/nodeschool
        ls -C
    end
end
