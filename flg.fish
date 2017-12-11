function flg
	if test -z "$argv"
        echo 'no options selected'
        return
    end

    getopts $argv | while read -l key options
        switch $key
            case _
                echo 'unknown option or default'
            case i
                echo 'install selected'
            case o
                echo 'open selected'
            case p
                echo 'read package.json selected'
            case '*'
                echo 'caught execption...'
        end
    end
end