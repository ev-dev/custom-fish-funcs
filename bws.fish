function bws
	for i in $argv
        if test (string sub -s 1 -l 2 $i) = 'c/'
            set caskitem (string sub -s 3 $i)
            spin "brew cask search $caskitem"
        else
            echo -e '\n\t\t- Results for "'"$i"'" -\n'
            spin "brew search $i"
            echo -e '___________________________________________________________'
        end
    end
end
