# Defined in - @ line 2
function c --argument dir
	if test -n "$dir"
        cd $dir
        ls
    else
        ls
    end
end
