# Defined in - @ line 2
function dl --argument subdir
	if test -z "$subdir"
        cd $dl
        ltr 15
    else
        cd $dl/$subdir
        l
    end
end
