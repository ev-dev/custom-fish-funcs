# Defined in - @ line 2
function tmp --argument subdir
	__fish_complete_path "/Users/admin/temp" -d "subdirs of ~/temp"

    if test -z "$subdir"
        cd $tmp
        ltr 15
    else
        cd $tmp/$subdir
        l
    end
end
