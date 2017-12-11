function __settitle_debug
    # echo "$argv" 1>&2
end


function __settitle_usage
    echo "
settitle sets iTerm2 tab title and color

Usage examples:
    settitle project1
        just change the title
    settitle project1 red
    settitle red project1
    settitle project1 1
    settitle 1 project1
        select ANSI 'red' color, with id 1 (argument order is guessed)
        available colors: black red green yellow blue magenta cyan white
        the colors are selected from the palette of 8
    settitle project1 ffeea0
    settitle project1 255 200 0
        pick any color in RGB representation
    settitle project1 work
        the color depends on hashed value of 'work'
    settitle
        reset title & color
    settitle defaultcolor
        reset color only

See also: setpalette
"

end

function settitle -d "sets terminal title"


    switch (count $argv)

    case 0
        __settitle_debug "no args given, reset title & color"
        __settitle_set_title
        __settitle_set_color "reset"
    case 1
        __settitle_debug "1 arg given"

        if test "x$argv[1]" = "x-h" -o "x$argv[1]" = "x--help"
            __settitle_usage
            return
        end

        set color (__settitle_guess_color $argv[1])
        if test -n "$color"
            __settitle_set_color $color
        else
            __settitle_set_title $argv[1]
        end
    case 2
        __settitle_debug "2 args given"
        set color (__settitle_guess_color $argv[2])
        if test -n "$color"
            __settitle_set_title $argv[1]
            __settitle_set_color $color
        else
            set color (__settitle_guess_color $argv[1])
            if test -n "$color"
                __settitle_set_title $argv[2]
                __settitle_set_color $color
            else
                __settitle_set_title $argv[1]
                __settitle_set_color (__settitle_hash_word $argv[2])
            end
        end

    case 3
        __settitle_debug "3 args given"
        for arg in $argv
            if test ! "(" "$arg" -ge 0 -a "$arg" -le 255 ")"
                echo "error: RGB values must be within the range 0..255"
                __settitle_usage
                return 1
            end
        end
        __settitle_set_color "$argv"
    case 4
        __settitle_debug "4 args given"
        for arg in $argv[2] $argv[3]
            if test ! "(" "$arg" -ge 0 -a "$arg" -le 255 ")"
                echo "error: RGB values must be within the range 0..255"
                __settitle_usage
                return 1
            end
        end

        if test "$argv[4]" -ge 0 -a "$argv[4]" -le 255
            __settitle_set_title $argv[1]
            __settitle_set_color "$argv[2] $argv[3] $argv[4]"
        else if test "$argv[1]" -ge 0 -a "$argv[1]" -le 255
            __settitle_set_title $argv[4]
            __settitle_set_color "$argv[1] $argv[2] $argv[3]"
        else
            echo "error: RGB values must be within the range 0..255"
            __settitle_usage
        end

    case '*'
        __settitle_usage
        return 1
    end

end


function __settitle_guess_color -a word
    switch $word
    case "black"
        echo (__settitle_get_color 1)
    case "red"
        echo (__settitle_get_color 2)
    case "green"
        echo (__settitle_get_color 3)
    case "yellow"
        echo (__settitle_get_color 4)
    case "blue"
        echo (__settitle_get_color 5)
    case "magenta"
        echo (__settitle_get_color 6)
    case "cyan"
        echo (__settitle_get_color 7)
    case "white"
        echo (__settitle_get_color 8)
    case "defaultcolor"
        echo "reset"
    case '*'
        if echo $word | grep -E -q '^[0-9a-fA-F]{6}$'
            echo (__settitle_parse_hex $word)
        else if test "$word" -gt 0 -a "$word" -le 8
            echo (__settitle_get_color $word)
        else
            return 1
        end
    end
end

function __settitle_set_color -a rgb
    if test "$rgb" = "reset"
        __settitle_debug "resetting color to default"
        echo -ne "\033]6;1;bg;*;default\a"
        return
    end

    __settitle_debug "setting color to $rgb"

    eval set rgb $rgb

    echo -ne '\033]6;1;bg;red;brightness;'$rgb[1]'\a\033]6;1;bg;green;brightness;'$rgb[2]'\a\033]6;1;bg;blue;brightness;'$rgb[3]'\a'

end

function __settitle_set_title -a title
    if test "$title" = "defaulttitle" -o -z "$title"
        __settitle_debug "ressetting title to default"
        set -e settitle_title
        return
    end

    __settitle_debug "setting title to $title"
    set -g settitle_title "$title"
end

function __settitle_parse_hex -a colorhex
    set r (printf '%d' '0x'(echo $colorhex | cut -c1-2))
    set g (printf '%d' '0x'(echo $colorhex | cut -c3-4))
    set b (printf '%d' '0x'(echo $colorhex | cut -c5-6))
    echo $r $g $b
end


function __settitle_hash_word -a word
    __settitle_debug "setting color from the hash of \"$word\""
    set num (printf '%d\n' '0x'(echo $word | shasum | cut -c1-6))
    __settitle_debug "num: $num"
    set colid (echo $num '% 8 + 1' | bc)
    __settitle_debug "hashed colid: $colid"
    echo (__settitle_get_color $colid)
end


function __settitle_get_color -a colid
    # The variable generated automatically by `setpalette`
    set __settitle_palette "0 0 0" "255 77 131" "31 140 59" "31 201 91" "29 211 238" "137 89 168" "62 153 159" "255 255 255"

    echo $__settitle_palette[$colid]
end
