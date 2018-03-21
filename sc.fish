# Defined in - @ line 1
function sc
	cat package.json | jq '.scripts'
end
