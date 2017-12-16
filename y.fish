# Defined in - @ line 2
function y
	if test -e package-lock.json
        eko -NL $y'Found package-lock.json...Removing.'
        rm package-lock.json
    end

    if test -z "$argv"
        yarn
    else
        yarn add $argv
    end
end
