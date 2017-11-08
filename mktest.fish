# Defined in /Users/admin/.config/fish/functions/mktest.fish @ line 2
function mktest
	cd ~/webdev/JS/test-projects
    #    set normal (set_color normal)
    #    set greenU (set_color green --underline)

    if test -n "$argv"
        if begin
                [ $argv[1] = '--help' ]
                or [ $argv[1] = '-h' ]
                or [ $argv[1] = 'help' ]
            end
            set normal (set_color normal)
            set ital (set_color normal)
            set dim (set_color normal)
            set trueDim (set_color 989898)
            set blueU (set_color blue -u)
            set blue (set_color blue -o)
            set green (set_color green)
            set greenB (set_color green -o)
            set yellow (set_color yellow -u -o)
            set red (set_color red)
            echo -e '\n\t\t'"$yellow"'Make Test'"$normal"'  '"$trueDim"'(Custom Command)\n'
            echo -e '\t'"$normal"'Project generator for testing things quickly\n\twith no other setup required.\n'

            echo -e '\t'"$blueU"'Usage'"$normal"':  '"$greenB"'mktest'"$normal"' ['"$blue"'options'"$normal"'] or ['"$blue"'existing project'"$normal"']\n'
            #echo -e '\t'"$red"'Project generator for testing things quickly\n\twith no other setup required.\n'
            echo -e '\t'"$blueU"'Options'"$normal"':\n'
            echo -e '\t '"$green"'-n'"$normal"', '"$green"'--new '"$normal"' ['"$blue"'type'"$normal"'] ['"$blue"'new project name'"$normal"']'
            echo -e '\t   '"$dim"'Generates new project from customized\n\t   boilerplates and begins tracking with git\n'
            echo -e '\t'"$blueU"'Boilerplate Types'"$normal"':\n'

            echo -e '\t '"$green"'empty'"$dim"' - Scaffolds basic blank project'
            echo -e '\t '"$green"'node'"$dim"' - Blank nodejs setup'
            echo -e '\t '"$green"'exp'"$dim"' - Basic express server'
            echo -e '\t '"$green"'exp-seq'"$dim"' - Express server with postgresSQL'
            echo -e '\t '"$green"'react'"$dim"' - Simple react setup'
            echo -e '\t '"$green"'redux'"$dim"' - React with redux setup'
            echo -e '\t '"$green"'full'"$dim"' - Express, sequelize, react, react-redux\n'
            set_color normal

        else if begin
                [ $argv[1] = '--new' ]
                or [ $argv[1] = '-n' ]
            end

            set_color green
            echo -e ' - selected create new project...\n'

            set_color cyan
            if [ $argv[2] = 'full' ]
                echo -e ' - generating new project -\n'
                git clone -b express-sequelize-react-redux git@github.com:ev-dev/ev-dev-starter.git "$argv[3]"
                rm -rf ./.git
                git init
                echo ' '
                npm install
                cm 'Initial Commit: Forked from custom full starter'
                echo ' '
                code .

            else if [ $argv[2] = 'node' ]
                echo -e ' - Generating basic node.js project -\n'
                mkdir ./"$argv[3]"
                cd "$argv[3]"
                git init
                npm init -y
                touch app.js
                add
                cm 'Initial Commit: Only contains blank .js file'
                echo ' '
                code .

            else if [ "$argv[2]" = 'exp-seq' ]
                echo -e ' - Generating express/sequelize project -\n'
                git clone -b express-sequelize git@github.com:ev-dev/ev-dev-starter.git "$argv[3]"
                cd "$argv[3]"
                rm -rf ./.git
                git init
                echo ' '
                npm install
                cm 'Initial Commit: Forked from custom express-sequelize starter'
                echo ' '
                code .

            else if [ $argv[2] = 'react' ]
                echo -e ' - Generating new react project -\n'
                git clone -b react git@github.com:ev-dev/ev-dev-starter.git "$argv[3]"
                cd "$argv[3]"
                rm -rf ./.git
                git init
                echo ' '
                npm install
                cm 'Initial Commit: Forked from custom react starter'
                echo ' '
                code .

            else if [ $argv[2] = 'redux' ]
                echo -e ' - Generating new react-redux project -\n'
                git clone -b react-redux git@github.com:ev-dev/ev-dev-starter.git "$argv[3]"
                cd "$argv[3]"
                rm -rf ./.git
                git init
                echo ' '
                npm install
                cm 'Initial Commit: Forked custom react-redux starter'
                echo ' '
                code .

                #            else if [ $argv[2] = 'fullstack' ]
                #               echo -e ' - Generating new react-redux-sequelize project -\n'
                #              git clone -b react-redux-sequelize git@github.com:ev-dev/ev-dev-starter.git "$argv[3]"
                #             cd "$argv[3]"
                #            rm -rf ./.git
                #           git init
                #          echo ' '
                #         npm install
                #        cm 'Initial Commit: Forked custom react-redux-sequelize starter'
                #       echo ' '
                #      code .

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
