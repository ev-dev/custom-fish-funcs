# Defined in - @ line 2
function copy --description 'Copy file contents to clipboard'
	if test -f $argv
        cat $argv | pbcopy
        inf 'contents of '$YL$I"$argv"$N' copied to clipboard'
    else
        err $YL$I"$argv"$N' is not a regular file. Its contents cannot be copied.'
    end
end
