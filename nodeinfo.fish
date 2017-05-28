function nodeinfo --argument-names 'nodeContext' 'info'

    if test -z $info
        set info '--all'
    end


    function getInfo --argument-names 'context' 'infoType'
        set nodePaths (which -a node)
        set nodeSysVer (eval "$nodePaths[2]" -v)
        set nodeFnmVer (eval "$nodePaths[1]" -v)

        switch $context
            #-- System --
            case 'system' or '-s' or '-S' or '-sa' or '-Sa' or '-sp' or '-Sp' or '-sv' or '-Sv'

                #Options
                switch $infoType
                    #All
                    case '--all' or '-a'
                        set sysNodePath (ls -H $nodePaths[2])
                        set sysNodeSymlink (readlink $nodePaths[2])

                        printf "\033[0;46;30m        * System Node.js *        \033[0m\n"
                        printf "  - \033[0;40;33mVersion Managed with \033[0m"
                        printf "\033[1;40;33mHomeBrew\033[0m -\n"

                        printf " \033[1;40;31mSystem\033[0m Path ->  "
                        printf "\033[1;40;34m$sysNodePath\033[0m\n     \033[0;40;36msymlink -> \033[0m\033[0;40;36m$sysNodeSymlink\033[0m\n"

                        printf " \033[1;40;31mSystem\033[0m Version: \033[0;40;32m$nodeSysVer\033[0m\n\n"

                        #Path
                    case "--path"
                        echo -n '@System Node.js Path: '
                        ls -H $nodePaths[2]
                        readlink $nodePaths[2]
                        echo ' '

                        #Version
                    case "--version"
                        echo -n '@System Node.js Version: '
                        echo "$nodeSysVer"
                        echo ' '
                end


                #-- User --
            case 'user' or '-u' or '-ua' or '-up' or '-uv' or '-U' or '-Ua' or '-Up' or '-Uv'

                #Options
                switch $infoType
                    #All
                    case "--all" or "-a"
                        set usrNodePath (ls -H $nodePaths[1])
                        set usrNodeSymlink (readlink $nodePaths[1])

                        printf "\033[0;43;30m         * User Node.js *         \033[0m\n"
                        printf "   - \033[0;40;33mVersion Managed with \033[0m"
                        printf "\033[1;40;33mFnm\033[0m -\n"

                        printf " \033[1;40;32mFnm\033[0m Path ->  "
                        printf "\033[1;40;34m$usrNodePath\033[0m\n"

                        printf " \033[1;40;32mFnm\033[0m Version: \033[0;40;32m$nodeFnmVer\033[0m\n\n"

                        #Path
                    case "--path" or "-p"
                        echo -n '@User Node.js Path: '
                        ls -H $nodePaths[1]
                        readlink $nodePaths[1]
                        echo ' '
                        #Version
                    case "--version" or "-v"
                        echo -n '@User Node.js Version: '
                        echo "$nodeFnmVer"
                        echo ' '
                end
        end
    end

    if test -z $nodeContext
        clear
        getInfo 'system' '--all'
        getInfo 'user' '--all'
    else
        getInfo $nodeContext $info
    end

end