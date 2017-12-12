# Defined in /Users/admin/.config/fish/functions/bwi.fish @ line 2
function bwi
	echo -e "\n  Fetching package(s) information from HomeBrew..."
    for i in $argv
        if test (string sub -s 1 -l 2 $i) = 'c/'
            set caskitem (string sub -s 3 $i)

            #           set_color black -b brwhite
            echo -e '\n\n\n\t-  Cask Package:  `'"$i"'`  -          \n'

            set_color normal
            spin "brew info $caskitem"

            set_color yellow
            echo -e '___________________________________________________________'
            set_color normal
        else
<<<<<<< HEAD
#            echo -e '\n\n'
=======
            echo -e '\n\n'
>>>>>>> master

            #            set_color black -b brwhite
            echo -e '\t\t- Package:  `'"$i"'` -\t\t\t\t'
            true
            #isatty stdout
            #            if test $status -eq 1
            #                echo $status
            #                echo -e 'yes equal to one'
            #            else
            #                echo $status
            #                echo -e 'not equal to one'
            #            end

            set_color normal
            echo -e '\n\n'

            spin "brew info $i"

            set_color yellow
            echo -e '___________________________________________________________'
            set_color normal
            echo -e '\n'
        end
    end
end
