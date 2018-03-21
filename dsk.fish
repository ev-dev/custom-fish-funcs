# Defined in - @ line 2
function dsk --argument subdir
	if test -z "$subdir"
        cd $desktop
        ltr 15
    else
        cd $desktop/$subdir
        l
    end
end
