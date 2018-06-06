# Defined in - @ line 2
function pk
	if [ "$argv" = '-s' ]
        /bin/cat package.json | jq '.scripts'
    else if [ "$argv" = '-d' ]
        /bin/cat package.json | jq '{ Dependencies: .dependencies, DevDependencies: .devDependencies }'
    else if [ "$argv" = '-v' ]
        cat package.json
    else
        sc
        echo ''
        deps
    end
end
