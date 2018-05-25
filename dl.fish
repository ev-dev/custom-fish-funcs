# Defined in - @ line 2
function dl
	set action "$argv[2]"
    set file (string split / "$argv[1]")[-1]

    proc -b "Downloading "$YL$I"$file"$N

    spin "wget -q $argv[1] ^/dev/null"
    suc -a 'Download complete.'

    if [ "$action" = '-x' ]
        set exDir (string replace -r '\.tar\.gz$' '' "$file")

        proc 'Extracting tarball'
        spin "tar -zxf $file"

        if test -d "./$exDir"
            suc -a 'Extraction complete.'
            cd $exDir
            exa
        else
            warn -a "Extraction finished but no directory '$exDir' was found"
        end
    end
end
