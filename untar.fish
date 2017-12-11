# Defined in - @ line 2
function untar
	if [ "$argv[1]" = '-d' ]
        for arch in ./*.gz
            set extractDir (string replace '.gz' '' "$arch")
            mkdir "$extractDir"
            tar -xvzf "$arch" -C "$extractDir"
        end
    else
        tar -xvzf "$argv"
    end
end
