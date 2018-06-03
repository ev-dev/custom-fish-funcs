# Defined in - @ line 2
function ya
	if test "$argv[1]" = '-c'
        or test "$argv[1]" = '--clean'
        or test "$argv[-1]" = '-c'
        or test "$argv[-1]" = '--clean'

        proc -b 'Cleaning modules'
        rma ./node_modules yarn.lock
        yarn add $argv[2..-1]
    else
        yarn add $argv
    end
end
