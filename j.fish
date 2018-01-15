# Defined in - @ line 2
function j
	if test (count $argv) = 1
        cat $argv | jq
    else if test (count $argv) = 2
        cat $argv[1] | jq ".$argv[2]"
    else
        err 'j function is json parser. accepts 1-2 arguments'
    end
end
