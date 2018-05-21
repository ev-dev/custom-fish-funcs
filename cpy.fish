# Defined in - @ line 1
function cpy
	if test -e "$argv"
        set fileContents (cat "$argv")
        set txtLen (string length "$fileContents")
        cat "$argv" | pbcopy

        eko -I 'Copied file contents to clipboard '$YL"($txtLen chars)"
    else
        set txtLen (string length "$argv")
        echo "$argv" | pbcopy

        eko -I 'Copied text to clipboard '$YL"($txtLen chars)"
    end
end
