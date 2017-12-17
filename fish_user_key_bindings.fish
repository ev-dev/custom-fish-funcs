function fish_user_key_bindings
    # Bash style command combiners
    bind "&&" 'commandline -i "; and"'
    bind "||" 'commandline -i "; or"'

    ### fzy ###
    bind \cr 'fzy_select_history (commandline -b)'
    ### fzy ###
end
