# Defined in - @ line 1
function jjq
	cat $argv[1] | jq "$argv[2]"
end
