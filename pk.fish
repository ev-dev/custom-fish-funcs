# Defined in - @ line 2
function pk
	if [ "$argv" = '-s' ]
        cat package.json | jq '.scripts'
    else if [ "$argv" = '-d' ]
        cat package.json | jq '{ Dependencies: .dependencies, DevDependencies: .devDependencies }'
    else
        cat package.json | jq
    end
end
