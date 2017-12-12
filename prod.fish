# Defined in - @ line 2
function prod --argument dir
	if test -z "$dir"
        cd $prod
        ls
    else
        cd $prod/$dir
        ls -1
    end
end
