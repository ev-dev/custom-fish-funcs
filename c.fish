# Defined in /var/folders/c_/pcyxn7d55sv0qhpt4j9_vvfw0000gn/T//fish.LCPWfQ/c.fish @ line 2
function c --argument dir
	if test -n "$dir"
        cd $dir
        ls
    else
        ls
    end
end
