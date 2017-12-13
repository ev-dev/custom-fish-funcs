# Defined in - @ line 2
function local --argument dir
	if test -z "$dir"
        cd $local
        ls
    else
        cd $local/$dir
        ls -1
    end
end
