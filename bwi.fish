function bwi
	for i in $argv
        if test (string sub -s 1 -l 2 $i) = 'c/'
            set caskitem (string sub -s 3 $i)
            echo -e '\n\t-  '"$i"'  -\n'
            spin "brew info $caskitem"
            echo -e '___________________________________________________________'
        else
            echo -e '\n\t-  '"$i"'  -\n'
            spin "brew info $i"
            echo -e '___________________________________________________________'
        end
    end
end
