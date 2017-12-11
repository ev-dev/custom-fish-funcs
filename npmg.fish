function npmg
	set_color green
    if test -z "$argv"
        usageError 'npmg' 'the package(s) to install globally'
    else if [ (count $argv) -eq 1 ]
        echo 'one package'
    else
        set strArgs "$argv"
        echo "strArgs:  $strArgs"

        set packageList (string split " " "$argv")
        echo "packageList:  $packageList"

        set delimited (string join ", " $packageList)
        echo "delimited:  $delimited"

        echo -e "\n Globally installing: `$argv`"
        #npm i -g $argv
    end
end
