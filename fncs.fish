# Defined in - @ line 2
function fncs
	cd $conf/fish/functions
    set rows (string split '\n' (exa))
    for column in rows
        for file in (string split ' ' "$column")
            if not test -L
                echo $file
            end
        end
    end
end
