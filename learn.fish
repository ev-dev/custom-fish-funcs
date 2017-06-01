function learn --argument directory
    if test -n "$directory"
        cd ~/webdev/JS/learn-js/$directory
        ls
    else
        cd ~/webdev/JS/learn-js
        ls
    end
end
