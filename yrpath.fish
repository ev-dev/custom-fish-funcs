# Defined in - @ line 2
function yrpath
	set yrn (ls -l -G (which yarn) | string replace -r '[l|-]([r|-][w|-][x|-]){3}(\\s*\\S*\\s*){7}' '')
    set symtest (string match -r '[>]+' "$yrn")[1]
    if test -n "$symtest"
        set split (string split '>' "$yrn")
        set sym (string trim --right --chars='\-' "$split[1]")
        set abs $split[2]

        set absmatch (string match -r '(\.\.\/)' "$abs")
        if test -n "$absmatch"
            set symparent (string split -r -m1 / "$sym")[1]
            set absnodots (string split -m1 / "$abs")[2]
            echo -ns $PR" $sym" $YLb'   ' $N"$symparent"'/'"$absnodots"
        end
    else
        echo 'no match'
        echo $yrn
    end
end
