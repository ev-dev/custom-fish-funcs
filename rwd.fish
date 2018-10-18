# Defined in - @ line 2
function rwd
	set compact false
    set cwd ''

    if test -z "$argv"
        set cwd (string replace "$HOME" '~' (pwd))
    else
        #for arg in $argv
        #switch "$arg"
        #case -c --compact
        #set compact true
        #case \*
        #set cwd (string replace "$HOME" "~" "$arg")
        #end

        set cwd (string replace "$HOME" "~" "$argv")

    end
    #echo -e "\nCOMPACT=$compact"
    if test $compact = true
        echo 'using compact'
        set cwd (string replace -r "" "~" "$argv")
    end
    printf $cwd
end
