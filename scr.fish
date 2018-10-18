# Defined in - @ line 2
function scr
	set allCmds (string split \n (string replace -a -r '[\{\},"]' '' (/bin/cat package.json | jq '.scripts')))

    eko '            '$U'Scripts'$N'\n'
    for singleCmd in $allCmds
        if test -n "$singleCmd"
            set formated (string split ': ' "$singleCmd")
            set npmCmd $formated[1]
            set npmScript $formated[2]

            eko '    '$I$YL"$npmCmd"$N" -> "$BL"$npmScript"
        end
    end
end
