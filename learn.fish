# Defined in /Users/admin/.config/fish/functions/learn.fish @ line 2
function learn --argument dir
	if test -n "$dir"
        cd $learn/$dir
        ls -1
    else
        cd $learn
        ls
    end
end
