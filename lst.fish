function lst
	tree -C --du -h -L 3 -I node_modules --dirsfirst --filelimit 15 $argv
end
