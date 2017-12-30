# Defined in /Users/admin/.config/fish/functions/path.fish @ line 2
function path
	if test -z "$argv"
	      ekko 'case 1'
        echo -e {$PATH\\n}
        return
    else if test -e "$argv"
 	      ekko 'case 2'
        set abs (realpath "$argv")
        set absPath (string replace -r '^(\/Users\/admin)' '~' "$abs")
        echo -se " $absPath\n"
    else if test -L "$argv"
 	      ekko 'case 3'
        set cwd (pwd)
        set orig "$cwd/$argv"
        set abs (readlink "$argv")

        set origPath (string replace -r '^(\/Users\/admin)' '~' "$orig")
        set absPath (string replace -r '^(\/Users\/admin)' '~' "$abs")

        echo -se $PRb" $origPath "$N$YLb''$N"\n $absPath\n"
    else
        set orig (which $argv)
        set origPath (string replace -r '^(\/Users\/admin)' '~' "$orig")
        if test -L $orig
     	      ekko 'case 4 opt 1'
            set abs (realpath $origPath)
            set absPath (string replace -r '^(\/Users\/admin)' '~' "$abs")
            echo -se $PRb" $origPath "$N$YLb''$N$RD"\n $absPath\n"
            #echo -se $PR$I" $origPath\n          "$N$YL'        ↕'$N$RD"\n $absPath\n"
        else
    	      ekko 'case 4 opt 2'
            echo -se $RD" $origPath\n"
            return
        end
    end
end
