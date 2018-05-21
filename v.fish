# Defined in - @ line 2
function v
	if test -n "$argv"
        /Applications/Visual\ Studio\ Code\ -\ Insiders.app/Contents/Resources/app/bin/code --max-memory=8192 $argv
    else
        /Applications/Visual\ Studio\ Code\ -\ Insiders.app/Contents/Resources/app/bin/code --max-memory=8192 .
    end
end
