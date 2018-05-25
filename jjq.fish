# Defined in - @ line 2
function jjq
	cat $argv[1] | jq "$argv[2]"
end
