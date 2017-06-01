function bwi
	for i in $argv
        if test (string sub -s 1 -l 2 $i) = 'c/'
            brew cask info (string sub -s 3 $i)
        else
            brew info $i
            echo -e '\n\n----------------------------\n\n'
        end
    end
end
