function mkrepo
    set part1 "gcli repo create "
    set part2 "--desc='"
    set part3 "' > temp.txt"

    if begin
            test -z "$argv"
            or [ $argv[1] = 'help' ]
            or [ $argv[1] = '-h' ]
        end

        echo -e ' Custom Command: \'makerepo\' [<options>] <repo name> <description>\n'
        echo -e ' Utility to create and upload project to Github.\n'
        echo -e ' Options:'
        echo -e '      --push : if push is selected, the current directory will be uploaded to the new remote repository'

    else if begin
            [ $argv[1] = '--push' ]
            or [ $argv[1] = '-p' ]
        end

        spin "$part1 $argv[2] $part2 $argv[3..-1] $part3"
        rm temp.txt

        add
        cm Uploaded Repository to GitHub
        git remote add origin git@github.com:ev-dev/$argv[2].git
        git push -u origin master
        echo -e 'Uploaded Local Directory to New Github Repository "ev-dev/'"$argv[2]"'"\n'
        chrome -o github.com/ev-dev/$argv[2]

    else
        spin "$part1 $argv[1] $part2 $argv[2..-1] $part3"
        rm temp.txt
        echo -e 'Created New Empty Repository on GitHub at "ev-dev/'"$argv[1]"'"\n'
    end
end
