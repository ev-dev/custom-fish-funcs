function flagtest
	if test -z "$argv"
        echo 'no options selected'
        return
    end

    switch $argv
        case '*i*o*p*'
            echo 'ALL OPTIONS'
            echo 'install selected'
            echo 'read package.json selected'
            echo 'open selected'
        
        case '*i*p*'
            echo 'install selected'
            echo 'read package.json selected'

        case '*i*o*'
            echo 'install selected'
            echo 'open selected'

        case '*o*p*'
            echo 'open selected'
            echo 'read package.json selected'

        case '*i*'
            echo 'install selected'
        
        case '*o*'
            echo 'open selected'
        
        case '*p*'
            echo 'read package.json selected'
    end
end

    # else if contains -- -i $argv
    #     echo 'install selected'
    #     if contains -- -o $argv
    #         echo 'open selected'
    #         if contains -- -p $argv
    #             echo 'read package.json selected'
    # else
    #     echo 'unrecognized option!'
    # end
