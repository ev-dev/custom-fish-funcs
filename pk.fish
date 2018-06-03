# Defined in - @ line 2
function pk
	if [ "$argv" = '-s' ]
        /bin/cat package.json | jq '.scripts'
    else if [ "$argv" = '-d' ]
        /bin/cat package.json | jq '{ Dependencies: .dependencies, DevDependencies: .devDependencies }'
    else
        /bin/cat package.json | jq
    end
end
