# Defined in - @ line 1
function lx
	if test -n "$argv"
        ls -lhrt | tail "-$argv"
    else
        ls -lhrt | tail -10
    end
end
