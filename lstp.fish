function lstp
	tree -C --du -p -h -L 3 -I node_modules --dirsfirst --filelimit 15 $argv
end
