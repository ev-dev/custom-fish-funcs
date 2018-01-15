# Defined in - @ line 1
function cf
	if test -z "$argv"
        c $conf
    else
        c "$conf/$argv"
    end
end
