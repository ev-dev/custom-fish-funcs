# Defined in - @ line 2
function ficonfig
	if test -n "$argv"
        micro ~/.config/fish/functions/$argv.fish
    else
        cd ~/.config/fish/functions
    end
end
