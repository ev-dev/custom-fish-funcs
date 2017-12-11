# Defined in - @ line 1
function vsi
	set toOpen '.'
    if test -n "$argv"
        set toOpen "$argv"
    end
    /Applications/Visual\ Studio\ Code\ -\ Insiders.app/Contents/Resources/app/bin/code "$toOpen"
end
