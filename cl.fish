function cl --argument fullname newname
    if test -z $newname
        set newrepo (string split / "$fullname")[-1]
        git clone https://github.com/$fullname.git
        cd $newrepo
    else
        git clone https://github.com/$fullname.git $newname
        cd $newname
    end

    echo -e '\nNew Repository Setup In:'
    pwd
    echo ' '
    ls
    echo ' '
end