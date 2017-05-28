function cl --argument fullname
    set newrepo (string split / "$fullname")[-1]
    git clone https://github.com/$fullname.git
    cd $newrepo
    echo -e '\nNew Repository Setup In:'
    pwd
    echo ' '
    ls
    echo ' '
end
