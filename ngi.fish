function ngi --argument package
    if test -n "$package"
        npm install -g $package
    else
        echo 'Invalid argument, must select package to install...'
    end
end
