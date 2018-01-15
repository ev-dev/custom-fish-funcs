# Defined in - @ line 2
function suc
	if test (count $argv) -gt 1
        if test "$argv[1]" = '-b'
            echo ''
            eko -S "$argv[2..-1]"
        else if test "$argv[1]" = '-a'
            eko -S "$argv[2..-1]\n"
        else if test "$argv[1]" = '-ba' -o "$argv[1]" = '-ab'
            echo ''
            eko -S "$argv[2..-1]\n"
        else
            eko -S $argv
        end
    else
        eko -S $argv
    end
end
