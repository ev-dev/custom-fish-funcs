# Defined in - @ line 2
function learn --argument dir
	if test -n "$dir"
        cd $learn/$dir
        ls -1
    else
        cd $learn
        ls
    end
end
