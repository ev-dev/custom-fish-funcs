function bws
	for i in $argv
if test (string sub -s 1 -l 2 $i) = 'c/'
brew cask search (string sub -s 3 $i)
else
brew search $i
end
end
end
