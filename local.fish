function local
	cd ~/webdev/JS/local-dev-repos/$argv
tree -C --dirsfirst --filelimit 20 -I node_modules
end
