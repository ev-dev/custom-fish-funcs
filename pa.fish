# Defined in - @ line 1
function pa
	if test -z "$argv"
        inf '$PATH environment variable listed 1st down'
        echo -e {$PATH\\n}
        return
    else if test (count $argv) -eq 1
        set WHICH_PATH (which $argv)
        set REALPATH_WHICH (realpath "$WHICH_PATH")

    end
end
