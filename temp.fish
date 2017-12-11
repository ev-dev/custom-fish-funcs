# Defined in - @ line 1
function temp
	cd ~/temp
    if test -n "$argv"
        eval "$argv"
    end
end
