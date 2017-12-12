<<<<<<< HEAD
# Defined in - @ line 2
function lst
	tree -CD --du -h -L 3 -I node_modules --dirsfirst --filelimit 15 $argv
=======
function lst
	tree -C --du -h -L 3 -I node_modules --dirsfirst --filelimit 15 $argv
>>>>>>> master
end
