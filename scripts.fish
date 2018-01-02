# Defined in - @ line 1
function scripts
	cat package.json | jq '.scripts'
end
