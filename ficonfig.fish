function ficonfig
    if test -n "$argv"
        micro ~/.config/fish/functions/$argv.fish
    else
        cd ~/.config/fish/functions
        ls
    end
end
