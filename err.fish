# Defined in - @ line 2
function err
	if test (count $argv) -gt 1
        if test "$argv[1]" = '-b'
            echo ''
            eko -ERR "$argv[2..-1]"
        else if test "$argv[1]" = '-a'
            eko -ERR "$argv[2..-1]\n"
        else if test "$argv[1]" = '-ba' -o "$argv[1]" = '-ab'
            echo ''
            eko -ERR "$argv[2..-1]\n"
        else
            eko -ERR $argv
        end
    else
        eko -ERR $argv
    end
end
