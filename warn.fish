# Defined in - @ line 2
function warn
	if test (count $argv) -gt 1
        if test "$argv[1]" = '-b'
            echo ''
            eko -W "$argv[2..-1]"
        else if test "$argv[1]" = '-a'
            eko -W "$argv[2..-1]\n"
        else if test "$argv[1]" = '-ba' -o "$argv[1]" = '-ab'
            echo ''
            eko -W "$argv[2..-1]\n"
        else
            eko -W $argv
        end
    else
        eko -W $argv
    end
end
