# Defined in - @ line 2
function y
	if test -e package-lock.json
        eko -nltb $YL'Found package-lock.json...Removing.'
        rm package-lock.json
    end

    if test -z "$argv"
        yarn
    else if test "$argv" = '-c'
        or test "$argv" = '--clear'

        proc -b 'Cleaning modules'
        rma ./node_modules yarn*
        yarn
    else
        yarn add $argv
    end
end
