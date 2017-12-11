# Defined in - @ line 2
function tst
	if test -z "$argv"
        set_color red
        echo -e '\n - Must provide name of existing test project or -a to list all...\n'
        set_color normal
    else
        cd ~/webdev/JS/test-projects
        if [ $argv[1] = '-a' ]
            l -1C
        else
            echo -e ' - Searching for test project named \''"$argv"'\'\n'

            cd "$argv" >temp.txt ^&1
            if [ $status -ne 0 ]
                #set_color red
                #echo ' - No project found with name...use \'mktest\' to create new test project'
                #rm temp.txt
                eval "$argv"
            else
                set_color cyan
                echo ' - Test project found...showing contents'
                set_color normal
                lst
            end
        end
    end
end
