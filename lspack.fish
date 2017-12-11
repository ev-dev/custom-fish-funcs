function lspack
    set full (cat ./package.json)

    set depsMatch (string match -r -n 'dependencies' "$full")
    set devDepsMatch (string match -r -n 'devDependencies' "$full")

    set depsInd (string split ' ' "$depsMatch")[1]
    set depsInd (math $depsInd + 21)
    set devDepsInd (string split ' ' "$devDepsMatch")[1]
    set devDepsStart (math $devDepsInd + 24)


    set depsLength (math $devDepsInd - $depsInd)
    set depsStr (string sub -s $depsInd -l $depsLength "$full")
    set depsStr (string replace -r -a '[\"]+' '' "$depsStr")
    set depsList (string split ',' "$depsStr")
    set devDepsStr (string sub -s $devDepsStart "$full")
    set devDepsStr (string replace -r -a '[\"]+' '' "$devDepsStr")
    set devDepsList (string split ',' "$devDepsStr")

    set depsCount 0
    for i in $depsList
        set depsCount (math $depsCount + 1)
    end
    set depsCount (math $depsCount - 1)


    set devDepsCount 0
    for i in $devDepsList
        set devDepsCount (math $devDepsCount + 1)
    end


    echo '    *  NPM Details  *'
    echo -e '\n     Dependencies:' $depsCount
    echo '    -----------------'

    for package in $depsList
        set braket (string match -r '[\}]+' "$package")
        if test -n "$braket"
            set package (string replace -r -a '[\s]+' '' "$package")
            set package (string replace -r -a '[:]+' '  ->  ' "$package")
            set package (string replace -r -a '[\}]+' '' "$package")
            echo '   ' $package
            break
        end

        set package (string replace -r -a '[\s]+' '' "$package")
        set package (string replace -r -a '[:]+' '  ->  ' "$package")
        echo '   ' $package
    end




    echo -e '\n     Dev Dependencies:' $devDepsCount
    echo '    ---------------------'

    for devpack in $devDepsList
        set brak (string match -r '[\}]+' "$devpack")
        if test -n "$brak"
            set devpack (string replace -r -a '[\s]+' '' "$devpack")
            set devpack (string replace -r -a '[:]+' '  ->  ' "$devpack")
            set devpack (string replace -r -a '[\}]+' '' "$devpack")
            echo '   ' $devpack
            break
        end

        set devpack (string replace -r -a '[\s]+' '' "$devpack")
        set devpack (string replace -r -a '[:]+' '  ->  ' "$devpack")
        echo '   ' $devpack
    end
end
