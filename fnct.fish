# Defined in - @ line 2
function fnct
	set norm (set_color normal)
    set green (set_color green)
    set cyan (set_color cyan)
    set blue (set_color blue -o)
    set yellow (set_color yellow)
    set red (set_color red)
    set numArgs (count $argv)

    if test $numArgs -eq 2
        if test "$argv[1]" = '-s'
            ls -l -t ~/.config/fish/functions | grep -v '__*' | head -(math $argv[2] + 1)
        else if test "$argv[1]" = '-v'
            set funcPath "/Users/admin/.config/fish/functions/$argv[2].fish"
            code $funcPath
            funcsave "$argv[2]"
        else if test "$argv[2]" = '-v'
            set funcPath "/Users/admin/.config/fish/functions/$argv[1].fish"
            code $funcPath
            funcsave "$argv[1]"
        end

    else if test $numArgs -eq 1
        if begin [ $argv = '-h' ]
                or [ $argv = '--help' ]
                or [ $argv = 'help' ]
            end
            echo -e "$norm"'\n\t- '"$green"'Utility for managing custom fish functions'"$norm"' -'

            echo -e "$cyan"'\n\tUsage:  '"$yellow"'fnc'"$norm"' ['"$blue"'option'"$norm"'] ['"$blue"'function'"$norm"']'
            echo -e "$cyan"'\n\tOptions:'

            echo -e "$green"'\t  -l'"$norm"': List all (sorted by name)'
            echo -e "$green"'\t  -s '"$red"'amount'"$norm"': List recently edited (sorted by last edit)'
            echo -e "$green"'\t  -o'"$norm"': Open all in VSCode'
            echo -e "$green"'\t  -v'"$norm"': Open in VSCode'
            echo -e "$green"'\t  -m'"$norm"': Open in Micro Editor (default)\n'

        else if begin [ $argv = '-l' ]
                or [ $argv = '-a' ]
            end
            ls -C ~/.config/fish/functions | grep -v '__*'

        else if [ $argv = '-s' ]
            ls -C -t ~/.config/fish/functions | grep -v '__*'

        else if [ $argv = '-o' ]
            code "/Users/admin/.config/fish/functions/"

        else
            m "/Users/admin/.config/fish/functions/$argv.fish"
            funcsave "$argv"

            inf -ba "Function '$argv' saved"
        end
    else
        cd "/Users/admin/.config/fish/functions/"

        echo -e "$red"'\n\tDid not provide a function to edit...\n\tEntering fish functions\' directory.\n'

        $blue
        ls -C . | grep -v '__*'
    end
end
