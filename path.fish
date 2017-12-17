# Defined in - @ line 2
function path
	if test -z "$argv"
        echo -e {$PATH\\n}
        return
    else if test -e "$argv"
        set abs (realpath "$argv")
        set absPath (string replace -r '^(\/Users\/admin)' '~' "$abs")
        echo -se " $absPath\n"
    else if test -L "$argv"
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
            set abs (realpath $origPath)
            set absPath (string replace -r '^(\/Users\/admin)' '~' "$abs")
            echo -se $PRb" $origPath "$N$YLb''$N$RD"\n $absPath\n"
            #echo -se $PR$I" $origPath\n          "$N$YL'        ↕'$N$RD"\n $absPath\n"
        else
            echo -se $RD" $origPath\n"
            return
        end
    end
end
