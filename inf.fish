# Defined in - @ line 2
function inf
	if test (count $argv) -gt 1
        if test "$argv[1]" = '-b'
            echo ''
            eko -I "$argv[2..-1]"
        else if test "$argv[1]" = '-a'
            eko -I "$argv[2..-1]\n"
        else if test "$argv[1]" = '-ba' -o "$argv[1]" = '-ab'
            echo ''
            eko -I "$argv[2..-1]\n"
        else
            eko -I $argv
        end
    else
        eko -I $argv
    end
end
