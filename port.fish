# Defined in - @ line 2
function port
	if test -n "$argv"
        if test (math $argv) -gt 0
            sudo lsof -aPi -p $argv
        else
            sudo lsof -i tcp:"$argv"
        end
    else
        sudo lsof -i
    end
end
