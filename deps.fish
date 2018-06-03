# Defined in - @ line 2
function deps
	set allDeps (string split \n (string replace -a -r '[\{\},"]' '' (/bin/cat package.json | jq '.dependencies')))
    set allDevDeps (string split \n (string replace -a -r '[\{\},"]' '' (/bin/cat package.json | jq '.devDependencies')))

    eko '         '$U'Dependencies'$N' ('(math (count $allDeps) - 2)') \n'
    for singleDep in $allDeps
        if test -n "$singleDep"
            set formated (string split ': ' "$singleDep")
            set pkg $formated[1]
            set version (string replace '^' '' "$formated[2]")

            eko '    '$CY"$pkg"$N"  v"$YL"$version"
        end
    end

    eko '\n       '$U'Dev Dependencies'$N' ('(math (count $allDevDeps) - 2)')\n'
    for singleDevDep in $allDevDeps
        if test -n "$singleDevDep"
            set formated (string split ': ' "$singleDevDep")
            set pkg $formated[1]
            set version (string replace '^' '' "$formated[2]")

            eko '    '$CY"$pkg"$N"  v"$YL"$version"
        end
    end
end
