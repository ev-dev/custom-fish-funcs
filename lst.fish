# Defined in - @ line 2
function lst
	if test -n "$argv"
        set argCount (count $argv)
        if test $argCount -gt 1
            if [ $argv[1] = '-v' ]
                tree -CD --du -h --dirsfirst -I node_modules -L 3 --filelimit 15 $argv[2]
            else
                eko -nltb $RD'- Error use either -v option for verbose or dirname'
            end
        else
            if [ $argv = '-v' ]
                tree -CD --du -h --dirsfirst -I node_modules -L 3 --filelimit 15
            else
                tree -C --dirsfirst -I node_modules -L 3 --filelimit 15 $argv
            end
        end
    else
        tree -C --dirsfirst -I node_modules -L 3 --filelimit 15
    end
end
