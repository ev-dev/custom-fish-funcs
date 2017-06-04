function mktest
    cd ~/webdev/JS/test-projects

    if test -n "$argv"
        if begin
                [ $argv[1] = '--help' ]
                or [ $argv[1] = '-h' ]
                or [ $argv[1] = 'help' ]
            end

            echo -e ' Custom Command:  \'maketest\' [<options> | <existing project>]  (defaults to cd & ls test-projects)\n'
            echo -e ' Project generator for testing things quickly\n with no other setup required.\n'
            echo -e ' Options: [-cl | -n] <type or name> <new project name> <other options>\n'
            echo -e '     --clone'
            echo -e '      -cl <remote repo name> <new project name> [-i] <install options> :'
            echo -e '      creates new project from remote repository (must give name as next argument)\n'
            echo -e '      Clone Options: --install or -i:  run npm install after cloning repo'
            echo -e '           postinstall options:'
            echo -e '           --start (runs \'npm start\' after install)'
            echo -e '           --build (runs \'npm run build\' after install)'
            echo -e '           --build-start (runs both \'npm run build\' & \'npm start\')\n\n'
            echo -e '     --new'
            echo -e '      -n <boilerplate type> <new project name> [--watch]'
            echo -e '      generates new project from custom boilerplates and begins git tracking\n'
            echo -e '      Boilerplate Types:  [empty | nodejs | full]'
            echo -e '           empty:  scaffolds basic blank project'
            echo -e '           nodejs:  basic nodejs setup'
            echo -e '           full:  comprehensive setup with a few common packages'
            echo -e '      *optional \'--watch\' after project name will open project in chrome and livereload on changes\n\n'

        else if begin
                [ $argv[1] = '--clone' ]
                or [ $argv[1] = '-cl' ]
            end

            set repoName (string split / "$argv[2]")
            echo -e ' selected create new project from remote repository...\n'
            echo -e ' - cloning \''"$repoName[2]"'\' from github'
            cl $argv[2]

            if begin
                    [ $argv[3] = '--install' ]
                    or [ $argv[3] = '-i' ]
                end

                echo -e ' - installing npm packages\n'

                spin "npm install > temp.txt"
                lspack #custom npm package lister

                if [ $argv[4] = '--start' ]
                    echo -e ' - running npm start\n'
                    npm start
                else if [ $argv[4] = '--build' ]
                    echo -e ' - building project\n'
                    npm run build
                else if [ $argv[4] = '--build-start' ]
                    echo -e ' - building project\n'
                    npm run build
                    echo -e '\n - running npm start\n'
                    npm start
                end
            end

        else if begin
                [ $argv[1] = '--new' ]
                or [ $argv[1] = '-n' ]
            end

            echo -e ' selected create new project...\n'

            if [ $argv[2] = 'full' ]
                echo -e ' - generating new project with custom boilerplate settings'
                echo -e ' - setting up npm packages and static page'

                cp -R ./SCAFFOLD_GENERATOR ./"$argv[3]"
                cd "$argv[3]"
                git init
                npm init -y
                cm 'Initial Commit: Cloned from Custom Scaffold Generator'
                lst
                echo ' '

                #open project in chrome and set page to refresh on changes in dir
                if [ $argv[4] = '--watch' ]
                    echo -e ' - opening new project\'s \'index.html\' in browser'
                    chrome-cli open file://(pwd)/index.html
                    echo -e ' - setting browser to refresh on changes in directory'
                    echo -e ' - now watching ' "$argv[3]"
                    echo ' '
                    livereloadx ./
                end

            else if [ $argv[2] = 'nodejs' ]
                echo -e ' - generating JavaScript scaffold...'
                mkdir ./"$argv[3]"
                cd "$argv[3]"
                git init
                npm init -y
                touch app.js
                add
                cm 'Initial Commit: Only contains blank .js file'
                echo ' '
                code .

            else if [ $argv[2] = 'empty' ]
                mkd ./"$argv[3]"
                git init
                echo ' '
            end

        else
            echo -e ' - arguments not recongnized as command'
            echo -e ' - searching for project named \''"$argv"'\'\n'

            cd "$argv" >temp.txt ^&1
            if [ $status -ne 0 ]
                echo ' -- no project found with name...use \'maketest\' with no arguments to list contents of test-projects'
                echo -e ' -- or use \'maketest --help\' for a list of available commands\n'
                rm temp.txt
            else
                echo ' - project found...showing contents'
                lst
            end
        end

    else
        echo -e ' - no arguments selected...use \'maketest --help\' for a list of available commands'
        echo -e ' - entering \'test-projects\' root directory and showing contents\n'
        ls -1 -C
        echo ' '
    end
end
