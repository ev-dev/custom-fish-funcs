# Defined in - @ line 2
function fsf
	if test -n "$argv"
        cd "$learn/fullstack/fellow/$argv"
        ls -1
    else
        cd $learn/fullstack/fellow
        ls -1
    end
end
