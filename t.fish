# Defined in /Users/admin/.config/fish/functions/t.fish @ line 1
function t
	if test -n "$argv"
        set secondChar (string sub --length 1 $argv)
        set dirAndFile (string split / "$argv")
        set inputPath (string join / $dirAndFile[1..-2])
        set relPath "./$inputPath"
        set newFile $dirAndFile[-1]

        if test "$secondChar" = "/"
            # first character must be ~tilde~ (cannot detect)
            mkdir -p "$inputPath"
            touch "$inputPath/$newFile"
            echo -e "created new file: $inputPath/$newFile"
        else
            mkdir -p "$relPath"
            touch "$relPath/$newFile"
            echo -e "created new file: $relPath/$newFile"
        end
    else
        echo -e '  - ERROR (Bad Usage) -\n\n `t` command needs an argument.. (the path for new file/s)\n'
    end
end
