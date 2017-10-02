function fsc
	if test -n "$argv"
        cd ~/webdev/JS/learn-js/fullstack/checkpoints/$argv
        lst
    else
        cd ~/webdev/JS/learn-js/fullstack/checkpoints
        l
    end
end
