function bwin
	for i in $argv
        if test (string sub -s 1 -l 2 $i) = 'c/'
            set caskitem (string sub -s 3 $i)
            echo -e '\n\t- Installing "'"$caskitem"'" -\n'
            spin "brew install $caskitem"
            echo -e '___________________________________________________________'
        else
            echo -e '\n\t- Installing "'"$i"'" -\n'
            spin "brew install $i"
            echo -e '___________________________________________________________'
        end
    end
end
