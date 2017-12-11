function funcs --argument-names "option-OR-func"

    # without args
    # list functions excluding those starting with __
    if test -z "$option-OR-func"
        #for file in (ls ~/.config/fish/functions)
        ls ~/.config/fish/functions

        # all argument cases    
    else
        switch "$option-OR-func"
            # list all functions in fish function directory
            case (string sub -l 1 "$option-OR-func")
                ls ~/.config/fish/functions
            case ""
                # edit individual function
                micro ~/.config/fish/functions/$selectedFunc.fish
        end
    end
end