# Defined in - @ line 2
function path
	if test -z "$argv"
        inf '$PATH environment variable listed 1st down'
        echo -e {$PATH\\n}
        return
    else if test (count $argv) -eq 1
        if test -e "$argv" -o -L "$argv"
            set abs (realpath "$argv")
            set absPath (string replace -r '^(\/Users\/admin)' '~' "$abs")
            set cwd (pwd)
            set removeRelPath (string replace -r '(\.\/)' '' "$argv")
            set requestedAbsPath "$cwd/$removeRelPath"
            set requestedTruePath (string replace -r '^(\/Users\/admin)' '~' "$requestedAbsPath")

            inf -a "requested "$YL$B$I"$argv" $N'found in path as symbolic link (case #1)'
            echo -e ' '$WH$B$D$U$I'SYMLINK '$N$YL$B'╭'$N$YL'->' $PR"$requestedTruePath"
            echo -e ' '$WH$B$D$I'COMMAND '$N$YL$B'╰'$N$YL'->' $RD"$absPath"
        else if test -L $orig
            set orig (which $argv)
            set origPath (string replace -r '^(\/Users\/admin)' '~' "$orig")
            set abs (realpath $orig)
            set absPath (string replace -r '^(\/Users\/admin)' '~' "$abs")

            inf -a "command "$YL$B$I"$argv" $N'found in path as symbolic link (case #2)'
            echo -e ' '$WH$B$D$U$I'SYMLINK '$N$YL$B'╭'$N$YL'->' $PR"$origPath"
            echo -e ' '$WH$B$D$I'COMMAND '$N$YL$B'╰'$N$YL'->' $RD"$absPath"
        else
            set which_path (which $argv)
            set realpath_which (realpath $which_path)
            set formatted (string replace -r '^(\/Users\/admin)' '~' "$realpath_which")

            warn "path shown for $argv may not be accurate (case #5)"
            inf -a "command "$YL$B$I"$argv" $N'found in path as symbolic link (case #3)'
            echo -e ' '$WH$B$D$U$I'SYMLINK '$N$YL$B'╭'$N$YL'->' $PR"$which_path"
            echo -e ' '$WH$B$D$I'COMMAND '$N$YL$B'╰'$N$YL'->' $RD"$realpath_which"
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
            inf -a "command "$YL$B$I"$argv[1]" $N'found in path as symbolic link (case #4)'
            echo -e ' '$WH$B$D$U$I'SYMLINK '$N$YL$B'╭'$N$YL'->' $PR"$origPath"
            echo -e ' '$WH$B$D$I'COMMAND '$N$YL$B'╰'$N$YL'->' $RD"$absPath"
            proc -b 'entering parent directory for' $YL$B$I"$argv[1]"

            set absParent (string replace -r '(\/\w+)$' '' "$abs")
            cd "$absParent"
        else
            err "$argv[1] had unknown option $argv[2]"
        end
    end
end
