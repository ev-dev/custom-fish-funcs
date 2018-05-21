# Defined in - @ line 2
function .... --argument dir
	if test -n "$dir"
        cd ../../../$dir
    else
        cd ../../../
    end
end
