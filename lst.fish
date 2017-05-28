function lst
	tree -C --du -h -L 3 -I node_modules --dirsfirst --filelimit 10 $argv
end
