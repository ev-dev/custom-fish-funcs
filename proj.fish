# Defined in /Users/admin/.config/fish/functions/proj.fish @ line 2
function proj
	if test -z "$argv"
        set_color red
        echo -e '\n - Must provide name of existing project...\n'
    else
        set_color cyan
        echo -e ' - Searching for project named \''"$argv"'\'\n'

        cd "$argv" >temp.txt ^&1
        if [ $status -ne 0 ]
            set_color red
            echo ' -- no project found with name...use \'mkproj\' to create new project'
            rm temp.txt
        else
            echo ' - Project found...showing contents'
            lst
        end
    end
end
