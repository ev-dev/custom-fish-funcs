function path
	if test -z "$argv"
        echo -e {$PATH\\n}
    else if test "$argv[1]" = '-v'
        ls -l (which $argv[2])
    else
        realpath (which "$argv")
    end
end
