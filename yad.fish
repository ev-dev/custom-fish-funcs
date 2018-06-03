# Defined in - @ line 2
function yad
	if test "$argv[1]" = '-c'
        or test "$argv[1]" = '--clean'
        or test "$argv[-1]" = '-c'
        or test "$argv[-1]" = '--clean'

        proc -b 'Cleaning modules'
        rma ./node_modules yarn.lock
        yarn add -D $argv[2..-1]
    else
        yarn add -D $argv
    end
end
