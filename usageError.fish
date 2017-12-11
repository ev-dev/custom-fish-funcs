# usageError parameters 
# 1 - 'cmd name' 
# 2 - 'paramater description'
# 3 - 'custom error check/message'
# 4 - 'cmd description'
# 5 - 'usage'

# Usage:
# > usageError 'mkd' 'the name/path of the new directory' 'create and enter a new directory' 'my-new-folder'

# --> 

function usageError
    set argsCount (count $argv)
    set_color red

    switch $argsCount
        case 4
            echo -e "\n  - ERROR: Bad Usage -"

        case 3
            echo -e "\n  - ERROR: Bad Usage -"
            echo -e "\n  `$argv[1]` needs an argument ($argv[2])\n"
            echo -e ""
        case 2
            echo -e "\n  - ERROR: Bad Usage -"

        case '*'
            echo -e "\n ONE OR NO ARGS"
    end

    # else if [ $argsCount -eq 2 ]
    #     echo -e "\n  - ERROR: Bad Usage -"

    #     isatty stdout
    #     if test $status -eq 0
    #         echo -e "\n  `$argv[1]` needs an argument ($argv[2])\n"
    #     else
    #         set_color yellow -u
    #         if test $status -eq 0
    #             echo -e "\n `$argv[1]` needs an arguemtn ($argv[2])\n"
    #         end
    #     end

    # else
    #     # interal error catch - problem with usageError itself
    #     set_color red
    #     echo -e "\n  - Problem with usageError handler! -"

    #     set_color yellow
    #     echo -e "  custom `usageError` function accepts a command and a argument description\n"

    #     set_color cyan
    #     echo -e "  Utility:"
    #     set_color normal
    #     echo -e "     invoke `usageError` as the default error handler when defining a new function\n"

    #     set_color cyan
    #     echo -e "  Usage:"
    #     set_color normal
    #     echo -e "    usageError 'mkd' 'the name & path of the new directory"

    #     set_color red
    #     echo -e "  -->  - ERROR: Bad Usage -\n       `mkd` needs an argument (the name & path of the new directory)\n"
    # else if [ $argsCount -eq 2 ]

end
