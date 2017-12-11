# Defined in /Users/admin/.config/fish/functions/c.fish @ line 2
function c --argument dir
	if test -n "$dir"
        cd $dir
        ls -1
    else
        ls
    end
end
