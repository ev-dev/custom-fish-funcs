# Defined in - @ line 2
function lt
	set flags "-C"
    set levels 2
    set dir "./"

    getopts $argv | while read -l key value
        switch $key
            case _
                test \( $argv -eq 1 \) -o \( $argv -ne 1 \) ^/dev/null
                if test $status -eq 0
                    #tree -C --dirsfirst -I venv -L $argv --filelimit 15
                    set levels $argv
                else
                    #tree -C --dirsfirst -I venv -L 3 --filelimit 15 $argv
                    set dir $argv
                end

            case l L
                set levels $value

                #tree -C --dirsfirst -I venv -L $value --filelimit 15
            case v
                set flags "-CD --du"
                #tree -CD --du -h --dirsfirst -I venv -L 3
        end
    end
    tree "$flags" --dirsfirst -L $levels -I venv --filelimit 15 $dir
end
