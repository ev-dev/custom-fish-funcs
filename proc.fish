# Defined in - @ line 2
function proc
	if test (count $argv) -gt 1
        if test "$argv[1]" = '-b'
            echo ''
            eko -B "$argv[2..-1]"
        else if test "$argv[1]" = '-a'
            eko -B "$argv[2..-1]"
            echo ''
        else if test "$argv[1]" = '-ba' -o "$argv[1]" = '-ab'
            echo ''
            eko -B "$argv[2..-1]"
            echo ''
        else
            eko -B $argv
        end
    else
        eko -B $argv
    end
end
