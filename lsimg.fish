# Defined in - @ line 2
function lsimg --argument dir size
	set prefix '\033]1337;File=name='
    set suffix '\a\033[A'

    test -n "$size"
    or set size '10'

    set opt ";inline=1;height=$size;width=$size;preserveAspectRatio=true"

    for file in (/bin/ls -1 "$dir")
        set filename (echo -n "$file" | base64)
        set imgBinary (base64 < "$file")

        set image "$prefix$filename$opt:$imgBinary$suffix"

        echo -ne "$file"
        printf "$image\n"
        #echo -ne "$file"
    end
end
