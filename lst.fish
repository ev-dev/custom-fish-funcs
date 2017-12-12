# Defined in - @ line 2
function lst
	tree -CD --du -h -L 3 -I node_modules --dirsfirst --filelimit 15 $argv
end
