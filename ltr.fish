# Defined in - @ line 2
function ltr
	set levels 1
    set listCnt 10
    if test -n "$argv"
        if test (count $argv) -lt 2
            set listCnt (math $argv + 1)
        else
            set listCnt (math $argv[1] + 1)
            set levels $argv[2]
        end
    end
    tree -riCc --dirsfirst -L "$levels" --sort=mtime --timefmt $YL'%b-%d-%y'$RD' %l:%M'$N' %p'$N | head "-$listCnt"
end
