# Defined in - @ line 2
function str_repeat_width
	set width (tput cols)
    set padding 0

    getopts $argv | while read -l key value
        switch $key
            case c color
                echo -ne $value''
            case l lines
                set width (math "$width * $value")
            case p padding
                set padding $value
            case '*'
                set str "$value"
        end
    end

    if test $padding -ne 0
        echo -e (string repeat '\n' -n $padding)
        string repeat "$str" -n $width -m $width -N
        echo -e (string repeat '\n' -n $padding)
    else
        string repeat "$str" -n $width -m $width -N
    end
end
