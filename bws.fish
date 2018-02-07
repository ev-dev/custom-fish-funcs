# Defined in - @ line 2
function bws
	for pkg in $argv
        if test (string sub -s 1 -l 2 $pkg) = 'c/'
            set caskitem (string sub -s 3 $pkg)
            spin "brew cask search $caskitem"
        else
            proc "searching for $PR$B$I$pkg$N...\n"
            spin "brew search $pkg"
            str_repeat_width '_' -c $YL$B -n
        end
    end
end
