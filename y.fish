# Defined in - @ line 2
function y
	if test -e package-lock.json
        eko -NL $y'Found package-lock.json...Removing.'
        rm package-lock.json
    end
    yarn
end
