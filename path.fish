# Defined in - @ line 2
function path
	if test -z "$argv"
        inf '$PATH environment variable listed 1st down'
        echo -e {$PATH\\n}
        return
    else if test (count $argv) -eq 1
        set orig (which $argv)
        set origPath (string replace -r '^(\/Users\/admin)' '~' "$orig")
        set abs (realpath $origPath)
        set absPath (string replace -r '^(\/Users\/admin)' '~' "$abs")

        if test -e "$argv"
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
        else if test -L $orig
            inf -a "command "$YL$B$I"$argv" $N'found in path as symbolic link'
            echo -e ' '$WH$B$D$U$I'SYMLINK '$N$YL$B'╭'$N$YL'->' $PR"$origPath"
            echo -e ' '$WH$B$D$I'COMMAND '$N$YL$B'╰'$N$YL'->' $RD"$absPath"
        else
            ekko 'case 4'
            warn "path shown for $argv may not be accurate"
            echo -se $RD" $origPath\n"
            return
        end
    else if test (count $argv) -eq 2
        set orig (which $argv[1])
        set origPath (string replace -r '^(\/Users\/admin)' '~' "$orig")
        set abs (realpath $origPath)
        set absPath (string replace -r '^(\/Users\/admin)' '~' "$abs")

        if begin
                [ "$argv[2]" = '-c' ]
                or [ "$argv[2]" = '--cd' ]
            end
            inf -a "command "$YL$B$I"$argv[1]" $N'found in path as symbolic link'
            echo -e ' '$WH$B$D$U$I'SYMLINK '$N$YL$B'╭'$N$YL'->' $PR"$origPath"
            echo -e ' '$WH$B$D$I'COMMAND '$N$YL$B'╰'$N$YL'->' $RD"$absPath"
            proc -b 'entering parent directory for' $YL$B$I"$argv[1]"

            set absParent (string replace -r '(\/\w+)$' '' "$abs")
            cd "$absParent"
            #echo -e 'absParent is' $RD"$absParent"
        else
            err "$argv[1] had unknown option $argv[2]"
        end
    end
end
